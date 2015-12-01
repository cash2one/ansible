#!/bin/env python

import ansible.runner
import ansible.playbook
from ansible import callbacks
from ansible import utils
import ipdb

inventory = ansible.inventory.Inventory('inventory')
playbook = 'production.yml'

stats = callbacks.AggregateStats()
playbook_cb = callbacks.PlaybookCallbacks(verbose=utils.VERBOSITY)
runner_cb = callbacks.PlaybookRunnerCallbacks(stats, verbose=utils.VERBOSITY)

pb = ansible.playbook.PlayBook(
		playbook=playbook,
		inventory=inventory,
		stats=stats,
		callbacks=playbook_cb,
		runner_callbacks=runner_cb,
		check=True
		)

playnum = 0
for (play_ds, play_basedir) in zip(pb.playbook, pb.play_basedirs):
    playnum += 1
    play = ansible.playbook.Play(pb, play_ds, play_basedir,
                                  vault_password=pb.vault_password)
    label = play.name
    hosts = pb.inventory.list_hosts(play.hosts)
    ipdb.set_trace()

    #if options.listhosts:
    print '  play #%d (%s): host count=%d' % (playnum, label, len(hosts))
    for host in hosts:
    	print '    %s' % host

    #if options.listtags or options.listtasks:
    #print '  play #%d (%s):\tTAGS: [%s]' % (playnum, label,','.join(sorted(set(play.tags))))

    #if options.listtags:
    #tags = []
    #for task in pb.tasks_to_run_in_play(play):
    #	tags.extend(task.tags)
    #    print '    TASK TAGS: [%s]' % (', '.join(sorted(set(tags).difference(['untagged']))))

    #if options.listtasks:

    #for task in pb.tasks_to_run_in_play(play):
    #    if getattr(task, 'name', None) is not None:
    #                # meta tasks have no names
    #   	    print '    %s\tTAGS: [%s]' % (task.name, ', '.join(sorted(set(task.tags).difference(['untagged']))))

