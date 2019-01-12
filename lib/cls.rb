module Cls
  VERSION = "0.0.3"

  def takes(*args)
    define_initialize(args)
  end

  def define_initialize(args)
    assignments = args.map { |a| "@#{a} = #{a}" }.join("\n")
    alias_method :given_initialize, :initialize
    self.class_eval %{
      def initialize(#{args.join(", ")})
                     #{assignments}
          given_initialize
      end
    }
  end

  def let(name, &block)
    define_method(name, &block)
  end
end

