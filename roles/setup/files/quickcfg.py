# -*- coding: gbk -*-
# -----------------------------------------------------------------------
#    @file            quickcfg.py
#    @brief           
#    @author          Hou Ming Yuan
#    @copyright       Onwind Digital Inc.
#    @date            Fri Dec 22 14:35:00 2006
# -----------------------------------------------------------------------


from xml.dom.minidom import *
from ConfigParser import *
import os
import urllib
import sys
import getpass
import datetime
import copy
from optparse import OptionParser


def GetConfigData(url):
    if "http:" in url:
        f = urllib.urlopen(url)
        assert f != None
        if f == None:
            print 'open url: %s failed:' % url
        else:
            return parseString(f.read())
    else:
        f = open(url)
        assert f!=None
        return parse(f)

class ServerCfgMaker:
    def __init__(self):
        self.serverUid = 1
        self.predefUidList = ()
        self.isDebug = False
        self.targetDir = '.'
        self.header = None
        self.cluster = None

    def GetTargetDir(self):
        return self.targetDir

    def GenerateZusHeader(self, file):
        self.header = "REM This file generate by quickcfg.py.\n"\
                      "REM USER    = %s\n"\
                      "REM PWD     = %s\n"\
                      "REM CFGFILE = %s\n"\
                      "REM DATETIME= %s\n"\
                      % (getpass.getuser(),
                         os.getcwd(),
                         file,
                         datetime.datetime.today())

    def GenerateHostFile(self, host):
        if not os.access("%s" % (self.GetTargetDir()), os.F_OK):
            os.mkdir("%s" % (self.GetTargetDir()))
        assert self.GetTargetDir() != ""
        assert self.GetHostDirName(host) != ""

        hostDir = "%s/%s" % (self.GetTargetDir(), self.GetHostDirName(host))
        if not os.access(hostDir, os.F_OK):
            os.mkdir(hostDir)
        else:
            for root, dirs, files in os.walk(hostDir, topdown=False):
                for name in files:
                    os.remove(os.path.join(root, name))
                for name in dirs:
                    os.rmdir(os.path.join(root, name))
            
        startScript = list()

        if self.header != None:
            startScript.append(self.header)
        
        for service in host.childNodes:
            if service.nodeName != "service":
                continue
            cmdline = self.GenerateServiceFile(service, host)
            startScript.append("startcom %s\n" % cmdline)

        
        self.GenerateAdminConfig()

        path = "%s/%s/startall.zus" % (self.GetTargetDir(), self.GetHostDirName(host))
        f = open(path, "w+")
        for l in startScript: f.write(l)
        f.close()
        
    def GenerateCfgFile(self, gCfgFile, isDebug, targetDir):
        self.GenerateZusHeader(gCfgFile)
        
        # 读入文件
        self.isDebug = isDebug
        if targetDir != None:
            if targetDir[-1] == '/':
                targetDir= targetDir[:-1]
            self.targetDir = targetDir
        dom = GetConfigData(gCfgFile)

        # 为主机生成文件
        for node in dom.childNodes:
            # 为服务器生成文件
            if node.nodeName!="cluster_configuration":
                continue
            self.cluster = node
            self.CheckMapIntegrity()
            self.predefUidList = self.GetPredefinedUid()
            #print 'already defined uid list', self.predefUidList
            for host in node.childNodes:
                if host.nodeName!="host":
                    continue
                self.GenerateHostFile(host)        

    def CheckCover(self, allMaps, svrInfo, svrType):
        cpAllMaps = copy.deepcopy(allMaps)
        for svr in svrInfo:
            svrMaps = svr['map'].split(',')
            for m in svrMaps:
                if m not in allMaps:
                    print " %s on %s loaded unknown map %s" % (svrType, svr['ip'], m)
                    continue
                if m not in cpAllMaps:
##                    print (" %s on %s duplicated loaded map %s" % (svrType, svr['ip'], m))
##                    raise "cancel"
                    continue
                del cpAllMaps[cpAllMaps.index(m)]

        if len(cpAllMaps) > 0:
            print "有地图未被加载, ", cpAllMaps, svrType

    def GetDungeons(self):
        # 取得副本地图
        try:
            d = self.GetNodeAttr(self.cluster, 'maps', 'dungeons')
            if d == "":
                return d
            else:
                return FormatDungeon(d)
        except:
            return ""

    def Unique(self, allMaps):
        for m in allMaps:
            if allMaps.count(m) > 1:
                print ">>>map duplicate on maps sequence: ", m
                raise allMaps        
        
    def CheckMapIntegrity(self):
        # 1 所有地图都应当被游戏服务器加载，且仅加载一次
        allMaps = self.GetNodeAttr(self.cluster, 'maps', 'sequence').split(',')

        self.Unique(allMaps)

        gameSvrInfo = self.GetGameSvrInfo()
        self.CheckCover(allMaps, gameSvrInfo, 'gamesvr')

        # 2 所有地图都应当被npc服务器加载，且仅加载一次
        npcSvrInfo = self.GetNpcSvrInfo()
        self.CheckCover(allMaps, npcSvrInfo, 'npcsvr')

        # 3 npc服务器加载的地图集和必须是游戏服务器加载地图的子集
        for npcSvr in npcSvrInfo:
            isValid = False            
            for gameSvr in gameSvrInfo:
                isValid = WithIn(npcSvr['map'], gameSvr['map'])
                if isValid:
                    break
            if not isValid:
                print 'npc on %s load map failed :  ' % npcSvr[0]
                print "npc服务器加载的地图集和必须是游戏服务器加载地图的子集"
                raise

        # 4 位置服务器全局唯一
        trackSvrInfo = self.GetTrackSvrInfo()
        if (len(trackSvrInfo)) != 1:
            print "以下主机上都有位置服务器:"
            for svr in trackSvrInfo:
                print '\t', svr[0]

        # 5 同一主机上各服端口不能重复
        for host in self.cluster.childNodes:
            if host.nodeName != 'host':
                continue                
            self.CheckPortUnique(host)
                
    def GetHostDirName(self, host):
        if host.attributes.has_key('wanaddr'):
            return host.attributes['wanaddr'].value
        else:
            return host.attributes['ip'].value

    def GetServiceCfgPath(self, service, host, uid):
        cfgFileName = None
        svrType = service.attributes['type'].value
        if svrType == 'gamesvr':
            cfgFileName = 'gameserver.cfg'
        elif svrType == 'npcsvr':
            cfgFileName = 'npcserver.cfg'
        elif svrType == 'gatesvr':
            cfgFileName = 'gateserver.cfg'
        elif svrType == 'tracksvr':
            cfgFileName = 'tracksvr.cfg'
        elif svrType == 'chatsvr':
            cfgFileName = 'chatsvr.cfg'
        elif svrType == 'loginsvr':
            cfgFileName = 'loginsvr.cfg'
        elif svrType == 'logsvr':
            cfgFileName = 'logserver.cfg'

        assert cfgFileName != None, "no this kind of server %s" % svrType
        
        return "%s/%s/%s%s" % (self.GetTargetDir(), self.GetHostDirName(host), uid, cfgFileName)
    
    
    def GenerateAdminConfig(self):
        config = ConfigParser()

        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'serveradmin')
        config.set('common', 'server.console.prompt', '[AdminSvr]')

        config.set('common', 'logfile' , 'adminsvr.log')
        config.set('common', 'exit_script', 'adminexit.zus')
        config.set('common', 'net_port', '23000')
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'net_cryptmode', '2')
        config.set('common', 'auth_ldap', '0')
        
        if self.isDebug:
            config.set('common', 'auto_restart', '0')
        else:
            config.set('common', 'auto_restart', '1')
            
        ## [cluster.ident]
        config.add_section('cluster.ident')
        regionUid = self.GetRegionUid()
        serverUid = self.NextServerUid()
        config.set('cluster.ident', 'cluster.region.uid', regionUid)
        config.set('cluster.ident', 'cluster.server.uid', "%d" % (int(regionUid) * 1000 + serverUid))

        ## [persist] 
        config.add_section('persist')
        config.set('persist', 'persist.component', 'database')
        config.set('persist', 'persist.implement', 'MySQLConnection')
        config.set('persist', 'persist.hostname', self.GetLogPersistAttr('hostname'))
        config.set('persist', 'persist.database', self.GetLogPersistAttr('database'))
        config.set('persist', 'persist.username', self.GetLogPersistAttr('username'))
        config.set('persist', 'persist.password', self.GetLogPersistAttr('password'))
        config.set('persist', 'persist.port', self.GetLogPersistPort())
        config.set('persist', 'persist.policy', '0')
        
        ## [path]
        self.BuildServerPath(config)

        ## [cluster]
        ## clustre.config
        if (self.HasDynConfig()):
            config.add_section("cluster")
            config.set('cluster', 'cluster.config', self.GetDynConfigAttr("url"))        
        
        ## white.list
        if (self.HasWhiteList()):
            config.add_section("white.list")
            config.set('white.list', 'valid.ip', self.GetWhiteList())
        
        config.add_section('memchk')
        config.set('memchk', 'memchk.commandline', 'valgrind --log-file=%svr.vallog --tool=memcheck --leak-check=yes')
        
        cfgfile = "%s/adminsvr.cfg" % (self.GetTargetDir())
        config.write(open(cfgfile, "w+"))
        

    def GenerateServiceFile(self, service, host):
        svrType = service.attributes['type'].value
        config = None
        if  svrType == 'gatesvr':
            config = self.GenerateGateConfig(service, host)
        elif svrType == 'gamesvr':
            config = self.GenerateGameConfig(service, host)
        elif svrType == 'npcsvr':
            config = self.GenerateNpcConfig(service, host)
        elif svrType == 'tracksvr':
            config = self.GenerateTrackConfig(service, host)
        elif svrType == 'chatsvr':
            config = self.GenerateChatConfig(service, host)
        elif svrType == 'datasvr':
            config = self.GenerateDataConfig(service, host)
        elif svrType == 'logsvr':
            config = self.GenerateLogConfig(service, host)
        elif svrType == 'loginsvr':
            config = self.GenerateLoginConfig(service, host)

        if config != None:
            sid = config.get('cluster.ident', 'cluster.server.uid')
            cfgfile = self.GetServiceCfgPath(service, host, sid)
            instdir = '.'
            if host.attributes.has_key('instdir'):
                instdir = host.attributes['instdir'].value
            
            config.write(open(cfgfile, "w+"))
            if (self.isDebug):
                return "%s/%sd -f %s -d %s -c" % (instdir, svrType, cfgfile, instdir)
            else:
                return "%s/%s -f %s -d %s -c" % (instdir, svrType, cfgfile, instdir)
        else:
            return ""
            

    def GetNodeAttr(self, parentNode, nodeName, attrName):
        for node in parentNode.childNodes:
            if node.nodeName == nodeName:
                return node.attributes[attrName].value
            
        print ">>>cfg file: parent node [%s] no child node [%s] with attr [%s]." % \
              (parentNode.nodeName, nodeName, attrName)
        raise KeyError

    def GetPersistAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, 'dbsvr', attrname)

    def GetLogPersistAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, 'logdbsvr', attrname)

    def GetLogPersistPort(self):
        if self.HasNodeAttr('logdbsvr', 'port'):
            return self.GetLogPersistAttr('port')
        else:
            return '0'

    def GetAuthSvrAttr(self, attrname, idx = 0):
        return self.GetNodeAttr(self.cluster, 'authsvr%d' %idx, attrname)

    def GetAwardSvrAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, 'awardsvr', attrname)

    def GetPathAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, 'path', attrname)

    def HasChildNode(self, parentNode, nodeName):
        for node in parentNode.childNodes:
            if node.nodeName == nodeName:
                return True
        return False

    def HasDynConfig(self):
        return self.HasChildNode(self.cluster, "dynconfig")

    def GetDynConfigAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, "dynconfig", attrname)

    def HasWhiteList(self):
        return self.HasChildNode(self.cluster, "admin")

    def GetWhiteList(self):
        return self.GetNodeAttr(self.cluster, "admin", "whitelist")

    def HasSoapNode(self):
        return self.HasChildNode(self.cluster, "soapauth")

    def HasNapNode(self):
        return self.HasChildNode(self.cluster, "napauth")

    def GetNapAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, "napauth", attrname)

    def GetSoapAttr(self, attrname):
        return self.GetNodeAttr(self.cluster, "soapauth", attrname)
    
    def HasPersistAttr(self, attrname):
        for node in self.cluster.childNodes:
            if node.nodeName == 'dbsvr':
                return node.attributes.has_key(attrname)
        return False

    def HasAuthSvrAttr(self, attrname, idx = 0):
        for node in self.cluster.childNodes:
            if node.nodeName == 'authsvr%d' %idx:
                return node.attributes.has_key(attrname)
        return False

    def HasAwardSvrAttr(self, attrname):
        for node in self.cluster.childNodes:
            if node.nodeName == 'awardsvr':
                return node.attributes.has_key(attrname)
        return False

    def HasNodeAttr(self, nodeName, attrName):
        for node in self.cluster.childNodes:
            if node.nodeName == nodeName:
                return node.attributes.has_key(attrName)
        return False

    def GetServerInetAddr(self, svrType):
        addrs = []
        for host in self.cluster.childNodes:
            if host.nodeName != 'host':
                continue
            for service in host.childNodes:
                if service.nodeName != 'service': continue
                if service.attributes['type'].value == svrType:
                    addrs.append({'ip':host.attributes['ip'].value,
                                  'port':service.attributes['port'].value})

        return addrs

    def GetPersistServer(self):
        addrs = self.GetServerInetAddr('loginsvr')
        assert len(addrs) == 1, ">>>>cfg file should has one service loginsvr "
        return addrs[0]['ip']

    def GetPersistPort(self):
        addrs = self.GetServerInetAddr(self.cluster, 'datasvr')
        assert len(addrs) == 1, ">>>>cfg file should has one service datasvr "
        return addrs[0]['port']

    def GetCryptMode(self, service):
        cryptMode = '0'
        if service.attributes.has_key('cryptmode'):
            cryptMode = service.attributes['cryptmode'].value
        return cryptMode

    def BuildIndent(self, config, service):
        config.set('common', 'exit_script', 'default_exit.zus') 
        config.add_section('cluster.ident')
        regionUid = self.GetRegionUid()
        serverUid = self.NextServerUid()
        if service.attributes.has_key('uid'):
            serverUid = int(service.attributes['uid'].value)

        config.set('cluster.ident', 'cluster.region.uid', regionUid)
        config.set('cluster.ident', 'cluster.server.uid', "%d" % (int(regionUid) * 1000 + serverUid))
        return (regionUid, serverUid)

    def BuildSoapSection(self, config):
        """ add auth.soap section for traditional chinese version """        
            
        if self.HasNapNode():
            config.set('bridge', 'auth.cryptalg', 'wayi2')
            config.add_section('auth.nap')
            config.set('auth.nap', 'sap', self.GetNapAttr('host'))        
        else:
            #print "no soapauth"
            pass
        
    def BuildPersist(self, config, service):
        policy = '0'
        if service.attributes['type'].value in ['gamesvr', 'gatesvr', 'tracksvr', 'chatsvr']:
            policy = '3'
        
        config.add_section('persist')
        config.set('persist', 'persist.component', 'database')
        config.set('persist', 'persist.implement', 'MySQLConnection')
        config.set('persist', 'persist.hostname', self.GetPersistAttr('hostname'))
        config.set('persist', 'persist.database', self.GetPersistAttr('database'))
        config.set('persist', 'persist.username', self.GetPersistAttr('username'))
        config.set('persist', 'persist.password', self.GetPersistAttr('password'))
        config.set('persist', 'persist.port', '0')
        config.set('persist', 'persist.policy', policy)

        snap_policy = '1'
        snap_period = '250'
        bucket_size = '4'
        if self.HasPersistAttr('snap.policy'):
            snap_policy = self.GetPersistAttr('snap.policy')        

        if self.HasPersistAttr('snap.period.msec'):
            snap_period =self.GetPersistAttr('snap.period.msec')
        
        if self.HasPersistAttr('bucket.size'):
            bucket_size = self.GetPersistAttr('bucket.size')

        config.set('persist', 'snap.policy', snap_policy)
        config.set('persist', 'snap.period.msec', snap_period)
        config.set('persist', 'bucket.size', bucket_size)
        
    def BuildServerPath(self, config):
        config.add_section('path')
        config.set('path', 'server.path.file', self.GetPathAttr('svrpath'))
        config.set('path', 'server.script.folder', self.GetPathAttr('scriptfolder'))

    def GenerateLogConfig(self, service, host):
        config = ConfigParser()

        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'LogServer-v0.1')
        config.set('common', 'server.console.prompt', '[Log Server]')

        config.set('common', 'logfile' , 'logserver.log')        
        config.set('common', 'net_port', service.attributes['port'].value)
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'net_cryptmode', self.GetCryptMode(service))
        
        config.set('common', 'adminserver_port', '23000')



        ## [cluster.ident]
        rid, sid = regionUid, serverUid = self.BuildIndent(config, service)

        ## [persist] 
        config.add_section('persist')
        config.set('persist', 'persist.component', 'database')
        config.set('persist', 'persist.implement', 'MySQLConnection')
        config.set('persist', 'persist.hostname', self.GetLogPersistAttr('hostname'))
        config.set('persist', 'persist.database', self.GetLogPersistAttr('database'))
        config.set('persist', 'persist.username', self.GetLogPersistAttr('username'))
        config.set('persist', 'persist.password', self.GetLogPersistAttr('password'))
        config.set('persist', 'persist.port', self.GetLogPersistPort())
        config.set('persist', 'persist.policy', '0')


        ## [log.database]
        config.add_section('log.database')
        config.set('log.database', 'log.db.truncation.space', '1')
        config.set('log.database', 'log.db.write.space', '600')
        
        ## [log.filter]
        config.add_section('log.filter')
        config.set('log.filter', 'filter.priority', "")
        config.set('log.filter', 'filter.messagetype', "")
        config.set('log.filter', 'filter.charlogtype', "")
        config.set('log.filter', 'filter.coinlogtype', "")
        config.set('log.filter', 'filter.itemlogtype', "")
        config.set('log.filter', 'filter.charexplogtype', "")
        config.set('log.filter', 'filter.coinlimit', "")
        
        return config

    def GenerateNpcConfig(self, service, host):
        config = ConfigParser()

        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'NpcServer-v0.1')
        config.set('common', 'server.console.prompt', '[Npc Server]')
        config.set('common', 'net_port', "")
        config.set('common', 'net_host', "")
        config.set('common', 'net_cryptmode', "")
        config.set('common', 'adminserver_port', '23000')
        config.set('common', 'logfile_enabled' , '0')

        trackInfo = self.GetTrackSvrInfo()
        assert len (trackInfo) == 1, "more than one track server. \n"
        config.set('common', 'trackserver_ip', trackInfo[0]['ip'])
        config.set('common', 'trackserver_port', trackInfo[0]['port'] )

        maps = service.attributes['map'].value
##        gameInfo = self.GetGameSvrInfoByMap(maps)
        line = service.attributes['line'].value
        gameInfo = self.GetGameSvrInfoByLine(line, maps)
        config.set('common', 'gameserver_ip', gameInfo[0]['ip'])
        config.set('common', 'gameserver_port', gameInfo[0]['port'] )

        config.set('common', 'load_maps', maps + self.GetDungeons())
##        config.set('common', 'path.directory', 'data/path')

        config.set('common', 'server_line', gameInfo[0]['line'])

        rid, sid = self.BuildIndent(config, service)
        self.BuildPersist(config, service)
        
        ## [path]
        self.BuildServerPath(config)

        return config


    def GenerateGameConfig(self, service, host):
        config = ConfigParser()

        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'GameServer-v0.1')
        config.set('common', 'server.console.prompt', '[Game Server]')
        config.set('common', 'net_port', service.attributes['port'].value)
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'net_cryptmode', self.GetCryptMode(service))
        config.set('common', 'adminserver_port', '23000')

        config.set('common', 'logfile_enabled' , '0')

        maps = service.attributes['map'].value
        config.set('common', 'load_maps', maps + self.GetDungeons())
        
        config.set('common', 'server_line', service.attributes['line'].value)

        ## [log.daemon]
        config.add_section('log.daemon')
        addr = self.GetServerInetAddr('logsvr')

        config.set('log.daemon', 'log.server.enable', '0')
        config.set('log.daemon', 'log.local.enable', '0')
        if len(addr) > 0:
            config.set('log.daemon', 'log.server.enable', '1')
            config.set('log.daemon', 'log.server.addr', addr[0]['ip'])
            config.set('log.daemon', 'log.server.port', addr[0]['port'])

        ## [cluster.ident]
        rid , sid = self.BuildIndent(config, service)

        ## [persist] 
        self.BuildPersist(config, service)
        
        ## [path]
        self.BuildServerPath(config)

##        ## [world.trigger]
##        config.add_section('world.trigger')
##        config.set('world.trigger', 'trigger.directory', 'data')

        ## [client.option]
        config.add_section('client.option')
        config.set('client.option', 'disconnect.cooldown', '6000')

        ## [track.server]
        config.add_section('track.server')
        config.set('track.server', 'track.server.enable', '1')

        trackInfo = self.GetTrackSvrInfo()
        assert len (trackInfo) == 1, "more than one track server. \n"
        config.set('track.server', 'track.server.addr', trackInfo[0]['ip'])
        config.set('track.server', 'track.server.port', trackInfo[0]['port'] )
        
        
        ## [url]
        config.add_section('query.server')
        config.set('query.server', 'query.host', self.GetNodeAttr(self.cluster, 'saleagent', 'url'))
            
        config.add_section('bridge')
        config.set('bridge', 'thread.count', '5')
        config.set('bridge', 'auth.host', self.GetAuthSvrAttr('url'))
        config.set('bridge', 'award.host', self.GetAwardSvrAttr('url'))

        self.BuildSoapSection(config)
        
        ## [log.filter]
        config.add_section('log.filter')
        config.set('log.filter', 'filter.priority', "")
        config.set('log.filter', 'filter.messagetype', "")
        
        config.add_section('char.stat')
        config.set('char.stat', 'char.addup.enabled', '1')
        config.set('char.stat', 'char.daily.enabled', '1')
        config.set('char.stat', 'char.maps.enabled', '1')
        config.set('char.stat', 'daily.stat.space', '300')

        return config
    
    def GenerateLoginConfig(self, service, host):
        config = ConfigParser()        
        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'LoginServer')
        config.set('common', 'server.console.prompt', '[LoginServer]')
        config.set('common', 'net_port', service.attributes['port'].value)
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'net_cryptmode', self.GetCryptMode(service))
        config.set('common', 'adminserver_port', '23000')
        
        if service.attributes.has_key("use_dns_name"):
            config.set('common', 'use_dns_name', service.attributes["use_dns_name"].value)
        else:
            config.set('common', 'use_dns_name', 'false')
        
        ## [log.daemon]
        config.add_section('log.daemon')
        addr = self.GetServerInetAddr('logsvr')

        config.set('log.daemon', 'log.server.enable', '0')
        config.set('log.daemon', 'log.local.enable', '0')
        if len(addr) > 0:
            config.set('log.daemon', 'log.server.enable', '1')
            config.set('log.daemon', 'log.server.addr', addr[0]['ip'])
            config.set('log.daemon', 'log.server.port', addr[0]['port'])
            
        ## [cluster.ident]
        rid, sid = self.BuildIndent(config, service)

        ## [persist] 
        self.BuildPersist(config, service)

        ## [bridge]
        config.add_section('bridge')
        config.set('bridge', 'thread.count', service.attributes['thread_count'].value)
        config.set('bridge', 'award.host', self.GetAwardSvrAttr('url'))
        for idx in range(10):
            sectionName = 'authsvr%d' %idx
            if self.HasAuthSvrAttr('type', idx):
                config.add_section(sectionName)
                config.set(sectionName, '%s.type' %sectionName, self.GetAuthSvrAttr('type', idx))
            if self.HasAuthSvrAttr('url', idx):
                config.set(sectionName, '%s.host' %sectionName, self.GetAuthSvrAttr('url', idx))
            if self.HasAuthSvrAttr('key', idx):
                config.set(sectionName, '%s.key' %sectionName, self.GetAuthSvrAttr('key', idx))
            if self.HasAuthSvrAttr('extra', idx):
                config.set(sectionName, '%s.extra' %sectionName, self.GetAuthSvrAttr('extra', idx))
            
        self.BuildSoapSection(config)

        ## [service]
        config.add_section('service')
        chatInfo = self.GetChatSvrInfo()
        config.set('service', 'chat_host', chatInfo[0]['wanaddr'])
        config.set('service', 'chat_port', chatInfo[0]['port'])

        return config

    def GenerateTrackConfig(self, service, host):
        config = ConfigParser()        
        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'TrackServer-v1.0')
        config.set('common', 'server.console.prompt', '[Track Server]')

        config.set('common', 'net_port', service.attributes['port'].value)
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'net_cryptmode', self.GetCryptMode(service))
        config.set('common', 'adminserver_port', '23000')
  
        ## [url]
        config.add_section('bridge')
        config.set('bridge', 'thread.count', '5')
        config.set('bridge', 'award.host', self.GetNodeAttr(self.cluster, 'awardsvr', 'url'))
		
        self.BuildSoapSection(config)

        ## [persist]
        self.BuildPersist(config, service)
        
        ## [path]
        self.BuildServerPath(config)

        ## [cluster.ident]
        rid, sid = self.BuildIndent(config, service)

        config.add_section('bulletin')
        config.set('bulletin', 'bulletin.db.intv', "60000")
        
        ## [log.daemon]
        config.add_section('log.daemon')
        addr = self.GetServerInetAddr('logsvr')

        config.set('log.daemon', 'log.server.enable', '0')
        config.set('log.daemon', 'log.local.enable', '0')
        if len(addr) > 0:
            config.set('log.daemon', 'log.server.enable', '1')
            config.set('log.daemon', 'log.server.addr', addr[0]['ip'])
            config.set('log.daemon', 'log.server.port', addr[0]['port'])


        return config

    def GenerateChatConfig(self, service, host):
        config = ConfigParser()        
        ## [common]
        config.add_section('common')
        config.set('common', 'server.console.progname', 'ChatServer-v1.0')
        config.set('common', 'server.console.prompt', '[Chat Server]')
        config.set('common', 'net_port', service.attributes['port'].value)
        
        if host.attributes.has_key('wanaddr'):
            exportIp = host.attributes['wanaddr'].value
        else:
            exportIp = host.attributes['ip'].value        
        
        if host.attributes.has_key("dnsname"):
            config.set('common', 'net_dnsname', host.attributes['dnsname'].value)
        
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'wanaddr', exportIp)
        config.set('common', 'adminserver_port', '23000')
        config.set('common', 'net_cryptmode', self.GetCryptMode(service))
        config.set('common', 'net_max_sending_buf_size',  '262144')
        
        ## [cluster.ident]
        rid, sid = self.BuildIndent(config, service)

        ## [persist] 
        self.BuildPersist(config, service)
        
        ## [server]
        config.add_section('server')
        trackInfo = self.GetTrackSvrInfo()
        assert len (trackInfo) == 1, "more than one track server. \n"
        config.set('server', 'track.server.ip', trackInfo[0]['ip'])
        config.set('server', 'track.server.port', trackInfo[0]['port'] )

        loginInfo = self.GetLoginServiceInfo()
        assert len (loginInfo) == 1, "more than one login server. \n"
        config.set('server', 'login.server.ip', loginInfo[0]['ip'])
        config.set('server', 'login.server.port', loginInfo[0]['port'] )

        return config

    def GenerateGateConfig(self, service, host):
        config = ConfigParser()

        config.add_section('common')
        config.set('common', 'server.console.progname', 'gateserver')
        config.set('common', 'server.console.prompt', '[Gate Server]')
        config.set('common', 'logfile', 'gateserver.log')
        config.set('common', 'net_port', service.attributes['port'].value)
        
        if host.attributes.has_key('wanaddr'):
            exportIp = host.attributes['wanaddr'].value
        else:
            exportIp = host.attributes['ip'].value        
            
        if host.attributes.has_key("dnsname"):
            config.set('common', 'net_dnsname', host.attributes['dnsname'].value)
        
        config.set('common', 'net_host', '0.0.0.0')
        config.set('common', 'wanaddr', exportIp)
        config.set('common', 'net_cryptmode', self.GetCryptMode(service))
        config.set('common', 'net_max_conn_count', '4000')
        config.set('common', 'adminserver_port', '23000')
        config.set('common', 'session.max', '10')
        config.set('common', 'net_max_sending_buf_size', '262144')

        self.BuildPersist(config, service)
        
        ## [path]
        self.BuildServerPath(config)
        
        rid, sid = self.BuildIndent(config, service)

        config.add_section('client.section')
        config.set('client.section', 'client.number.start', '1')
        config.set('client.section', 'client.number.end', '10000')
        config.set('client.section', 'client.heartbeat.lack', '24')

        config.add_section('auth.center')

        loginSvrInfos = self.GetLoginServiceInfo()
        config.set('auth.center', 'ac.server.host', loginSvrInfos[0]['ip'])
        config.set('auth.center', 'ac.server.port', loginSvrInfos[0]['port'])
        config.set('auth.center', 'ac.server.intv', 5000)

        config.add_section('bridge')
        config.set('bridge', 'thread.count', '5')
        config.set('bridge', 'auth.host', self.GetAuthSvrAttr('url'))
        config.set('bridge', 'award.host', self.GetAwardSvrAttr('url'))
        self.BuildSoapSection(config)

        ## [game.world]
        config.add_section('game.world')
        gameSvrInfos = self.GetGameSvrInfo()
        config.set('game.world', 'server.count', len(gameSvrInfos))
        for index in range(len(gameSvrInfos)):
            v = gameSvrInfos[index]
            option = "world.server.%d" % (index+1)
            value = "%d|%s|%s:%s|%s" % (index+1, v['line'], v['ip'], v['port'], v['map'])
            config.set('game.world', option, value)

        config.add_section('cache')
        config.set('cache', 'cache.charlist.max', '10000')
        
        ## [log.daemon]
        config.add_section('log.daemon')
        addr = self.GetServerInetAddr('logsvr')

        config.set('log.daemon', 'log.server.enable', '0')
        config.set('log.daemon', 'log.local.enable', '0')
        if len(addr) > 0:
            config.set('log.daemon', 'log.server.enable', '1')
            config.set('log.daemon', 'log.server.addr', addr[0]['ip'])
            config.set('log.daemon', 'log.server.port', addr[0]['port'])

        return config

    def GetGameSvrInfoByMap(self, maps):
        infoList = self.GetGameSvrInfo()
        validGameSvr = list()
        for info in infoList:
            if WithIn(maps, info['map']):
                validGameSvr.append(info)

        assert len(validGameSvr), "一个npc服务器只能连接一个游戏服务器，检查地图配置"
        return validGameSvr

    def GetGameSvrInfoByLine(self, line, maps):
        infoList = self.GetGameSvrInfo()
        validGameSvr = list()
        for info in infoList:
            if WithIn(line, info['line']) and WithIn(maps, info['map']):
                validGameSvr.append(info)

        assert len(validGameSvr), "一个npc服务器只能连接一个游戏服务器，检查地图配置"
        return validGameSvr

    def GetServiceAttr(self, service, attr):
        if service.hasAttribute(attr):
            return service.attributes[attr].value
        else:
            return ''

    def CheckPortUnique(self, host):
        ports = []
        hostname = host.attributes['ip'].value
        
        for service in host.childNodes:
            if service.nodeName != 'service': continue
            if self.GetServiceAttr(service, 'type') == 'npcsvr': continue
            
            port = self.GetServiceAttr(service, 'port')
            try: 
                if port == '':
                    raise
                int(port)
            except:
                print "host %s service %s : port %s is invalid" % (
                    hostname,
                    self.GetServiceAttr(service, 'type'),
                    port)
                raise
                
            if port in ports:
                print  "host %s : port %s dumplicate" % (hostname, port)
                raise 
            ports.append(port)
        
    def GetAllServiceInfoOnHost(self, host):
        infoList = list()
        for service in host.childNodes:
            if service.nodeName != 'service': continue
            infoList.append([host.attributes['ip'].value,
                             self.GetServiceAttr(service, 'port'),
                             self.GetServiceAttr(service, 'map')])

        return infoList

    def GetPredefinedUid(self):
        infoList = list()
        for host in self.cluster.childNodes:
            if host.nodeName != 'host':
                continue
            for service in host.childNodes:
                if service.nodeName != 'service': continue
                if service.attributes.has_key('uid'):
                    infoList.append(service.attributes['uid'].value)                   
        return infoList
    
    def GetAllServiceInfo(self, svrType):
        infoList = list()
        for host in self.cluster.childNodes:
            if host.nodeName != 'host':
                continue

            for service in host.childNodes:
                if service.nodeName != 'service': continue
                if service.attributes['type'].value == svrType:
                    key = 'ip'
                    if host.attributes.has_key('wanaddr'): key = 'wanaddr'
                    infoList.append({'ip':host.attributes['ip'].value,
                                     'port': self.GetServiceAttr(service, 'port'),
                                     'map': self.GetServiceAttr(service, 'map'),
                                     'line': self.GetServiceAttr(service, 'line'),
                                     'wanaddr': host.attributes[key].value,}
                    )

        return infoList
        

    def GetGameSvrInfo(self):
        return self.GetAllServiceInfo('gamesvr')

    def GetNpcSvrInfo(self):
        return self.GetAllServiceInfo('npcsvr')

    def GetTrackSvrInfo(self):
        return self.GetAllServiceInfo('tracksvr')

    def GetChatSvrInfo(self):
        return self.GetAllServiceInfo('chatsvr')

    def GetLoginServiceInfo(self):
        return self.GetAllServiceInfo('loginsvr')

    def NextServerUid(self):
        nextUid = self.serverUid
        self.serverUid += 1
        while str(nextUid) in self.predefUidList:
            nextUid = self.serverUid
            self.serverUid += 1
        return nextUid
    
    def GetRegionUid(self):
        return self.cluster.attributes['region_uid'].value

def WithIn(maps1, maps2):
    l1 = maps1.split(',')
    l2 = maps2.split(',')
    for i in l1:
        if not (i in l2):
            return False
    return True


def CreateParser():
    """
    create command line parser
    """
    usage = \
"""%prog XMLFILE [-d] [-t DIR]
       %prog -h"""

    desc = \
"""\
Genreate cluster of server's configuration files.
"""      
    parser = OptionParser(add_help_option=True, description = desc,
                      usage = usage)
    parser.add_option("-d", "--debug", dest='is_debug', default=False,
                  action="store_true", help='generate configraion file for debug version')
    
    parser.add_option('-t', '--target_directory', dest='target', metavar="DIR",
                  help='assign target directory')

    return parser
    

def FormatDungeon(maps):
    l = maps.split(",")
    r = list()
    for m in l:
        m = m.strip(" d")
        r.append(m)
    ret = ""
    for m in r:
        ret += ("," + m + 'd')        
    return ret

if __name__ == "__main__":
    # 1 create config maker
    maker = ServerCfgMaker()

    # 2 create command line parser
    parser = CreateParser()
    (options, args) = parser.parse_args()

    # check args
    if len(args) == 0:
        parser.print_help()
    else:        
        maker.GenerateCfgFile(args[0], options.is_debug, options.target)
