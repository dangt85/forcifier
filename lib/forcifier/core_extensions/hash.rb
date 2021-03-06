class Hash
  def deforce_keys!
    keys.each do |key|
      new_key = (key.downcase.gsub('__c','') rescue key) || key
      self[new_key] = delete(key)
      if self[new_key].is_a?(Hash) then self[new_key].deforce_keys! end
      if self[new_key].is_a?(Array)
        self[new_key].each { |record| record.deforce_keys! if record.is_a?(Hash) }
      end
    end
    self
  end
end
