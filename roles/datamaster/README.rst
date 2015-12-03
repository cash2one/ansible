建立数据库主库
===============

初始化产品数据库

Requirements
------------
CentOS 6+
MySQL Server

角色变量
--------------
1.  ``master.j2``

    **master_server_id**    MySQL Server Master Id

2.  ``mysql.yml``

    **db_name**         数据库名
    **repos_url**       数据库初始化文件所在的SCM URL
    **dest_dir**        初始化文件保存路径
    **svn_user**
    **svn_password**
    **new_db_username** 数据库访问者
    **new_db_password** 数据库访问者密码


功能说明
------------
1. 根据产品提供的初始化文件来初始化数据库


Example Playbook
----------------


License
-------



Author Information
------------------


