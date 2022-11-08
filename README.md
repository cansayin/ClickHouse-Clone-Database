# ClickHouse-Clone-Database
Script for clone a database in ClickHouse

First create a disk for take backups. Then give permission to ClickHouse user.

<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
mkdir /backups
chown clickhouse:clickhouse /backups
</code></pre>

<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
vi ch-dbClone.sh

change your password
clickhouse-client --password yourpassword
</code></pre>

<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
chmod 777 ch-dbClone.sh
</code></pre>

Then Run .sh

<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
./ch-dbClone.sh
</code></pre>


<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
----------------------------------------------------------------------
################# ClickHouse Database Clone Tool #################
----------------------------------------------------------------------

######### ClickHouse Databases ###########
------------------------------------------
"INFORMATION_SCHEMA"
"default"
"information_schema"
"system"
"test"
"test_dev1"
Please choose a database name:
Database Name :test
Please write a clone name:
Clone Name : clone
37360f96-e75d-436b-9a3f-abe44230f67c	BACKUP_CREATED
INFO: test Backup Has Been Taken
bbe08e69-2fb0-46f0-86de-d9f543f60cf7	RESTORED
INFO: test_branch Restore Finished
</code></pre>


<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
clickhouse01 :) show databases;

SHOW DATABASES

Query id: cf0de9a1-2c0d-464b-bf60-91e6c7e0f669

┌─name───────────────┐
│ INFORMATION_SCHEMA │
│ default            │
│ information_schema │
│ system             │
│ test               │
│ test_clone         │
│ test_dev1          │
└────────────────────┘
</code></pre>
