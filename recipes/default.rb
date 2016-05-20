include_recipe 'elasticsearch17'

elasticsearch_analysis_icu_version = '2.7.0' # elasticsearch 1.7
# elasticsearch_analysis_icu_version = '2.6.0' # elasticsearch 1.5

execute "/usr/local/bin/plugin -install elasticsearch/elasticsearch-analysis-icu/#{elasticsearch_analysis_icu_version}" do
  not_if { File.exist?("/usr/local/var/lib/elasticsearch/plugins/analysis-icu/elasticsearch-analysis-icu-#{elasticsearch_analysis_icu_version}.jar") }
end
