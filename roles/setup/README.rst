配置产品
=============

对产品进行配置并启动

Requirements
------------
必须安装产品

角色变量
--------------
1.  ``main.yml``

    **xml_cfg_file**    XML配置文件，建议由网页统一生成
    **dest_dir**        配置文件存入位置，此位置与产品安装位置有关


功能说明
------------
1. 配置产品


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
