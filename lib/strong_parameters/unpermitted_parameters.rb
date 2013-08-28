
module SinatraStrongParameters
  class UnpermittedParameters < IndexError
    attr_reader :params

    def initialize(params)
      @params = params
      super("found unpermitted parameters: #{params.join(', ')}")
    end
  end
end

