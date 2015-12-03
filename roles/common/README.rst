通用基础角色
=============

包含部署一台全新服务器所需的基础的，通用的功能任务，如Python基础库，EPEL，openssh，subversion等

Requirements
------------
CentOS 6+

角色变量
--------------

*   ``ntp.yml``

    **ntp_server**              时间更新服务器

*   ``openssh.yml``

    注意，当前匹配中不允许root通过ssh登陆，不允许使用密码登陆
    **ssh_port**
    **ssh_host**

*   ``user.yml``

    **username**                添加用户
    **user_authorized_ey**      登陆公钥

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.


功能说明
------------
1.  安装ntpdate, 将安装crontab, 每8小时同步一次系统时间
2.  更新openssh包和配置文件，禁止root登陆、只能使用密钥登陆
3.  安装subversion
4.  添加用户，并添加登陆公钥
5.  安装python-pip, supervisord，用于管理守护进程
6.  安装EPEL


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
