require 'json'
require 'hash-joiner'
require 'open-uri'

module Jekyll_Get
  class Generator < Jekyll::Generator
    safe true
    priority :highest

    def generate(site)
      config = site.data['test']
      if !config
        return
      end
      if !config.kind_of?(Array)
        config = [config]
      end
      config.each do |d|
        begin
          target = site.data[d['jdata']]
          source = JSON.load(open(d['json']))
          if target
            HashJoiner.deep_merge target, source
          else
            site.data[d['jdata']] = source
          end
          
        rescue
          next
        end
      end
    end
  end
end