# SYNTAX TEST "source.ruby"
require 'open-uri'

=begin
# <------ comment.block.documentation.ruby punctuation.definition.comment.ruby
foo bar baz
# <------------ comment.block.documentation.ruby
=end
# <---- comment.block.documentation.ruby punctuation.definition.comment.ruby

module Blam
# <------ meta.module.ruby keyword.control.module.begin.ruby
#      ^^^^ meta.module.ruby entity.name.type.module.ruby
  class Rawr
# ^^^^^ meta.module.ruby meta.class.ruby keyword.control.class.begin.ruby
#       ^^^^ meta.module.ruby meta.class.ruby entity.name.type.class.ruby
  end
# ^^^ meta.module.ruby meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
end
# <------ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
class MoreExamples
  FOO = :bar
# ^^^ variable.other.constant.ruby
#       ^^^^ constant.language.symbol.ruby
end
class ExampleClass < AnotherClass
#                  ^ punctuation.separator.inheritance.ruby
#                    ^^^^^^^^^^^^ entity.other.inherited-class.ruby
  attr_reader :foo, :bar
# ^^^^^^^^^^^ keyword.other.special-method.ruby
  attr_writer :baz, :bam
# ^^^^^^^^^^^ keyword.other.special-method.ruby
  attr_accessor :boom
# ^^^^^^^^^^^^^ keyword.other.special-method.ruby

  def initialize
# ^^^ keyword.control.def.begin.ruby
#     ^^^^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    a_method(arg1)
#   ^^^^^^^^ meta.function-call.ruby entity.name.function.ruby
#           ^ punctuation.section.function.ruby
#            ^^^^ variable.other.ruby
#                ^ punctuation.section.function.ruby
  end

  def a_method(arg1)
#     ^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
    hello_world = 10
#   ^^^^^^^^^^^ variable.other.ruby
#               ^ keyword.operator.assignment.ruby
#                 ^^ constant.numeric.ruby
    hello_world += 1
#               ^^ keyword.operator.assignment.augmented.ruby
    SomeClass::AnotherClass.new(key: 10, another_key: "value")
#   ^^^^^^^^^ support.class.ruby
#            ^^ punctuation.separator.namespace.ruby
#              ^^^^^^^^^^^^ support.class.ruby
#                          ^ punctuation.separator.method.ruby
#                           ^^^ keyword.other.special-method.ruby
    return :some_symbol
#   ^^^^^^ keyword.control.pseudo-method.ruby

    [].each do
#   ^ punctuation.section.array.begin.ruby
#    ^ punctuation.section.array.end.ruby
#           ^^ meta.block.do.ruby keyword.control.do.begin.ruby
    end
#   ^^^ keyword.control.do.end.ruby
  end
# ^^^ keyword.control.def.end.ruby

  def true?(obj)
    !!obj
#   ^^ keyword.operator.logical.ruby
  end

  def self.do
# ^^^ keyword.control.def.begin.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    @do ||= {}
#   ^ variable.other.readwrite.instance.ruby punctuation.definition.variable.ruby
#    ^^ variable.other.readwrite.instance.ruby
#       ^^^ keyword.operator.assignment.augmented.ruby
#           ^ punctuation.section.scope.begin.ruby
#            ^ punctuation.section.scope.end.ruby
  end
# ^^^ keyword.control.def.end.ruby
end


  weird_method :do || true
# ^^^^^^^^^^^^ variable.other.ruby
#              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#               ^^ constant.language.symbol.ruby
#                  ^^ keyword.operator.logical.ruby
#                     ^^^^ constant.language.boolean.ruby
