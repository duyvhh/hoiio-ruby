module Hoiio
  module RequestUtil

    def check_nil_or_empty(required_param_names=[], params)
      required_param_names.each { |p|
        if params[p].nil? || params[p].empty?
          raise Hoiio::InputError.new "Param " << p << " is missing"
        end
      }
    end

    def check_for_mutual_exclusivity(required_param_names=[], params)
      i = 0
      required_param_names.each { |p|
        if !params[p].nil? && !params[p].empty?
          i += 1
        end
      }

      if i == 0
        raise Hoiio::InputError.new "All required params are missing"
      elsif i > 1
        raise Hoiio::InputError.new "More than 1 required, mutually exclusive param are present."
      end
    end

  end
end