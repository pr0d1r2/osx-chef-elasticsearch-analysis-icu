include_recipe 'elasticsearch17'

elasticsearch_version = `/usr/local/bin/elasticsearch -v | cut -f 1 -d , | cut -f 2 -d : | cut -f1-2 -d .`.strip

case elasticsearch_version
when '1.7'
  elasticsearch_analysis_icu_version = '2.7.0'
when '1.5'
  elasticsearch_analysis_icu_version = '2.6.0'
else
  raise "Unsupported elasticsearch version: #{elasticsearch_version}"
end

execute "/usr/local/bin/plugin -install elasticsearch/elasticsearch-analysis-icu/#{elasticsearch_analysis_icu_version}" do
  not_if { File.exist?("/usr/local/var/lib/elasticsearch/plugins/analysis-icu/elasticsearch-analysis-icu-#{elasticsearch_analysis_icu_version}.jar") }
end
