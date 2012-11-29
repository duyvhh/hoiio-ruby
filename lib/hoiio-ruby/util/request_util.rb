#Copyright (C) 2012 Hoiio Pte Ltd (http://www.hoiio.com)
#
#Permission is hereby granted, free of charge, to any person
#obtaining a copy of this software and associated documentation
#files (the "Software"), to deal in the Software without
#restriction, including without limitation the rights to use,
#                                                        copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the
#Software is furnished to do so, subject to the following
#conditions:
#
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
#OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
#HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#OTHER DEALINGS IN THE SOFTWARE.

module Hoiio
  module RequestUtil

    # Utility methods

    # Check if any required parameter is missing in params hash
    #
    # @param required_param_names array of names of required parameters that need to be checked
    # @param params hash of params that will be used to check the presence of each required_param_name
    #
    # @return Hoiio::InputError if a required param is missing
    def check_nil_or_empty(required_param_names=[], params)
      required_param_names.each { |p|
        if params[p].nil? || params[p].empty?
          raise Hoiio::RequestError.new "Param " << p << " is missing"
        end
      }
    end

    # Check that only 1 required parameter is needed for specific API calls
    #
    # @param required_param_names array of names of required parameters that need to be checked
    # @param params hash of params that will be used to check the presence of each required_param_name
    #
    # @return Hoiio::InputError if a required param is missing or if all required params are present
    def check_for_mutual_exclusivity(required_param_names=[], params)
      i = 0
      required_param_names.each { |p|
        if !params[p].nil? && !params[p].empty?
          i += 1
        end
      }

      if i == 0
        raise Hoiio::RequestError.new "All required params are missing"
      elsif i > 1
        raise Hoiio::RequestError.new "More than 1 required, mutually exclusive param are present."
      end
    end

  end
end