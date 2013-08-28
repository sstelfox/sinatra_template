
module SinatraStrongParameters
  class Parameters < Hash
    attr_accessor :permitted
    alias :permitted? :permitted
  end
end

