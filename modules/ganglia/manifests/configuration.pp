# modules/ganglia/manifests/configuration.pp

class ganglia::configuration {
    $clusters = hiera('ganglia_clusters')

    $url = 'http://ganglia.wikimedia.org'
    # 208.80.154.14 is neon (icinga).
    # It is not actually a gmetad host, but it should
    # be allowed to query gmond instances for use by
    # neon/icinga.
    $gmetad_hosts = [ '208.80.154.53', '208.80.154.14' ]
    $aggregator_hosts = {
        'eqiad' => [ ipresolve('carbon.wikimedia.org') ],
        'esams' => [ ipresolve('bast3001.wikimedia.org') ],
        'codfw' => [ ipresolve('install2001.wikimedia.org') ],
        'ulsfo' => [ ipresolve('bast4001.wikimedia.org') ],
    }
    $base_port = 8649
    $id_prefix = {
        eqiad => 1000,
        codfw => 2000,
        esams => 3000,
        ulsfo => 4000,
    }
    $default_sites = ['eqiad','codfw']
}
