module VagrantPlugins
  module Abiquo
    module Actions
      class CheckState
        def initialize(app, env)
          @app = app
          @machine = env[:machine]
          @logger = Log4r::Logger.new('vagrant::abiquo::check_state')
        end

        def call(env)
          env[:machine_state] = @machine.state.id
          @logger.info "Machine state is '#{@machine.state.id}'"
          @app.call(env)
        end
      end
    end
  end
end
