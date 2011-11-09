class Hash
  def collect!(&block)
    ret = []
    self.each {|key,val|
      puts "#{key}: #{val}"
      if val.kind_of? Array
        val.collect!{|subval|
          block.call subval
        }
        ret = val
      elsif val.kind_of? String
        return self
      end
    }
    return ret
  end
end