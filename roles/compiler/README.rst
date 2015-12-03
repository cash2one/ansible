编译角色
=============

编译产品

Requirements
------------
1.  产品编译环境已经准备好
2.  有产品编译脚本

角色变量
--------------
1.  ``ompile.yml``

    **op_user**             执行者
    **compile_script**      产品编译脚本
    **source_dir**          源码所在目录

2.  ``wyft.sh.j2``

    **bin_src_dir**         源码编译结果所有目录
    **release_dir**         产品发布目录（与SCM仓库目录结构有关）
    **db_host**             
    **db_name**             
    **db_user**             
    **db_password**             

3.  ``release.yml``

    **repos_url**           内网产品SCM的URL
    **release_dir**         产品发布目录
    **svn_user**             
    **svn_password**             
    **op_user**             执行者

功能说明
------------
1. 编译产品
2. 并发布至内网SCM
3. tag ``update_data``\ 用于更新数据


Example Playbook
----------------


License
-------

BSD

Author Information
------------------

