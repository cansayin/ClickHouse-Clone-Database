# ClickHouse-Clone-Database
Script for clone a database in ClickHouse

First create a disk for take backups. Then give permission to ClickHouse user.

<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
mkdir /backups
chown clickhouse:clickhouse /backups
</code></pre>

Then Run .sh

<pre id="example"><code class="language-lang"  style="color: #333; background: #f8f8f8;"> 
./ch-dbClone.sh
</code></pre>
