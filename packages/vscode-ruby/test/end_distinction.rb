# SYNTAX TEST "source.ruby"
  class F; end
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#        ^ meta.class.ruby punctuation.separator.statement.ruby
#         ^ meta.class.ruby
#          ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
  class F end
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#        ^ meta.class.ruby
#         ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
  (class F end)
# ^ punctuation.section.function.ruby
#  ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#       ^ meta.class.ruby
#        ^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#         ^ meta.class.ruby
#          ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
#             ^ punctuation.section.function.ruby


  class Foo; @@a = 1; end
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^^^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#          ^ meta.class.ruby punctuation.separator.statement.ruby
#           ^ meta.class.ruby
#            ^^ meta.class.ruby variable.other.readwrite.class.ruby punctuation.definition.variable.ruby
#              ^ meta.class.ruby variable.other.readwrite.class.ruby
#               ^ meta.class.ruby
#                ^ meta.class.ruby keyword.operator.assignment.ruby
#                 ^ meta.class.ruby
#                  ^ meta.class.ruby constant.numeric.ruby
#                   ^ meta.class.ruby punctuation.separator.statement.ruby
#                    ^ meta.class.ruby
#                     ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
  class Foo::Bar < M::Baz; @@a = 1; end
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^^^ meta.class.ruby entity.name.type.class.ruby support.class.ruby
#          ^^ meta.class.ruby entity.name.type.class.ruby punctuation.separator.namespace.ruby
#            ^^^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#               ^ meta.class.ruby
#                ^ meta.class.ruby punctuation.separator.inheritance.ruby
#                 ^ meta.class.ruby
#                  ^ meta.class.ruby entity.other.inherited-class.ruby support.class.ruby
#                   ^^ meta.class.ruby entity.other.inherited-class.ruby punctuation.separator.namespace.ruby
#                     ^^^ meta.class.ruby entity.other.inherited-class.ruby variable.other.constant.ruby
#                        ^ meta.class.ruby punctuation.separator.statement.ruby
#                         ^ meta.class.ruby
#                          ^^ meta.class.ruby variable.other.readwrite.class.ruby punctuation.definition.variable.ruby
#                            ^ meta.class.ruby variable.other.readwrite.class.ruby
#                             ^ meta.class.ruby
#                              ^ meta.class.ruby keyword.operator.assignment.ruby
#                               ^ meta.class.ruby
#                                ^ meta.class.ruby constant.numeric.ruby
#                                 ^ meta.class.ruby punctuation.separator.statement.ruby
#                                  ^ meta.class.ruby
#                                   ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
  class A class B end end
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#        ^ meta.class.ruby
#         ^^^^^ meta.class.ruby meta.class.ruby keyword.control.class.begin.ruby
#              ^ meta.class.ruby meta.class.ruby
#               ^ meta.class.ruby meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#                ^ meta.class.ruby meta.class.ruby
#                 ^^^ meta.class.ruby meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
#                    ^ meta.class.ruby
#                     ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
  class A; class B; end; end
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#        ^ meta.class.ruby punctuation.separator.statement.ruby
#         ^ meta.class.ruby
#          ^^^^^ meta.class.ruby meta.class.ruby keyword.control.class.begin.ruby
#               ^ meta.class.ruby meta.class.ruby
#                ^ meta.class.ruby meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
#                 ^ meta.class.ruby meta.class.ruby punctuation.separator.statement.ruby
#                  ^ meta.class.ruby meta.class.ruby
#                   ^^^ meta.class.ruby meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
#                      ^ meta.class.ruby punctuation.separator.statement.ruby
#                       ^ meta.class.ruby
#                        ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby

  class Foo
# ^^^^^ meta.class.ruby keyword.control.class.begin.ruby
#      ^ meta.class.ruby
#       ^^^ meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
    @@var = 1
#^^^ meta.class.ruby
#   ^^ meta.class.ruby variable.other.readwrite.class.ruby punctuation.definition.variable.ruby
#     ^^^ meta.class.ruby variable.other.readwrite.class.ruby
#        ^ meta.class.ruby
#         ^ meta.class.ruby keyword.operator.assignment.ruby
#          ^ meta.class.ruby
#           ^ meta.class.ruby constant.numeric.ruby
    
#^^^^ meta.class.ruby
    $class = "myclass"
#^^^ meta.class.ruby
#   ^ meta.class.ruby variable.other.readwrite.global.ruby punctuation.definition.variable.ruby
#    ^^^^^ meta.class.ruby variable.other.readwrite.global.ruby
#         ^ meta.class.ruby
#          ^ meta.class.ruby keyword.operator.assignment.ruby
#           ^ meta.class.ruby
#            ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#             ^^^^^^^ meta.class.ruby string.quoted.double.interpolated.ruby
#                    ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    @@module = "mymodule"
#^^^ meta.class.ruby
#   ^^ meta.class.ruby variable.other.readwrite.class.ruby punctuation.definition.variable.ruby
#     ^^^^^^ meta.class.ruby variable.other.readwrite.class.ruby
#           ^ meta.class.ruby
#            ^ meta.class.ruby keyword.operator.assignment.ruby
#             ^ meta.class.ruby
#              ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#               ^^^^^^^^ meta.class.ruby string.quoted.double.interpolated.ruby
#                       ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    class_name = "class_name"
#^^^ meta.class.ruby
#   ^^^^^^^^^^ meta.class.ruby variable.other.ruby
#             ^ meta.class.ruby
#              ^ meta.class.ruby keyword.operator.assignment.ruby
#               ^ meta.class.ruby
#                ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                 ^^^^^^^^^^ meta.class.ruby string.quoted.double.interpolated.ruby
#                           ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    module_name = "module_name"
#^^^ meta.class.ruby
#   ^^^^^^^^^^^ meta.class.ruby variable.other.ruby
#              ^ meta.class.ruby
#               ^ meta.class.ruby keyword.operator.assignment.ruby
#                ^ meta.class.ruby
#                 ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                  ^^^^^^^^^^^ meta.class.ruby string.quoted.double.interpolated.ruby
#                             ^ meta.class.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    self.class.methods
#^^^ meta.class.ruby
#   ^^^^ meta.class.ruby variable.language.self.ruby
#       ^ meta.class.ruby punctuation.separator.method.ruby
#        ^^^^^ meta.class.ruby meta.function-call.ruby entity.name.function.ruby
#             ^ meta.class.ruby punctuation.separator.method.ruby
#              ^^^^^^^ meta.class.ruby meta.function-call.ruby entity.name.function.ruby
    self::class::methods
#^^^ meta.class.ruby
#   ^^^^ meta.class.ruby variable.language.self.ruby
#       ^^ meta.class.ruby punctuation.separator.method.ruby
#         ^^^^^ meta.class.ruby meta.function-call.ruby entity.name.function.ruby
#              ^^ meta.class.ruby punctuation.separator.method.ruby
#                ^^^^^^^ meta.class.ruby meta.function-call.ruby entity.name.function.ruby

# meta.class.ruby
    def module
#^^^ meta.class.ruby
#   ^^^ meta.class.ruby meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#      ^ meta.class.ruby meta.function.method.without-arguments.ruby
#       ^^^^^^ meta.class.ruby meta.function.method.without-arguments.ruby entity.name.function.ruby
      nil
#^^^^^ meta.class.ruby meta.function.method.without-arguments.ruby
#     ^^^ meta.class.ruby meta.function.method.without-arguments.ruby constant.language.nil.ruby
    end
#^^^ meta.class.ruby meta.function.method.without-arguments.ruby
#   ^^^ meta.class.ruby meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

# meta.class.ruby
    def class
#^^^ meta.class.ruby
#   ^^^ meta.class.ruby meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#      ^ meta.class.ruby meta.function.method.without-arguments.ruby
#       ^^^^^ meta.class.ruby meta.function.method.without-arguments.ruby entity.name.function.ruby
      nil
#^^^^^ meta.class.ruby meta.function.method.without-arguments.ruby
#     ^^^ meta.class.ruby meta.function.method.without-arguments.ruby constant.language.nil.ruby
    end
#^^^ meta.class.ruby meta.function.method.without-arguments.ruby
#   ^^^ meta.class.ruby meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  end
#^ meta.class.ruby
# ^^^ meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby

  Foo.new.module
# ^^^ support.class.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^ keyword.other.special-method.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^^^^ meta.function-call.ruby entity.name.function.ruby
  Foo.new::module
# ^^^ support.class.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^ keyword.other.special-method.ruby
#        ^^ punctuation.separator.method.ruby
#          ^^^^^^ meta.function-call.ruby entity.name.function.ruby
  Foo.new.class
# ^^^ support.class.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^ keyword.other.special-method.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^^^ meta.function-call.ruby entity.name.function.ruby
  Foo.new::class
# ^^^ support.class.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^ keyword.other.special-method.ruby
#        ^^ punctuation.separator.method.ruby
#          ^^^^^ meta.function-call.ruby entity.name.function.ruby

  module Mod; @a = 1; end
# ^^^^^^ meta.module.ruby keyword.control.module.begin.ruby
#       ^ meta.module.ruby
#        ^^^ meta.module.ruby entity.name.type.module.ruby
#           ^ meta.module.ruby punctuation.separator.statement.ruby
#            ^ meta.module.ruby
#             ^ meta.module.ruby variable.other.readwrite.instance.ruby punctuation.definition.variable.ruby
#              ^ meta.module.ruby variable.other.readwrite.instance.ruby
#               ^ meta.module.ruby
#                ^ meta.module.ruby keyword.operator.assignment.ruby
#                 ^ meta.module.ruby
#                  ^ meta.module.ruby constant.numeric.ruby
#                   ^ meta.module.ruby punctuation.separator.statement.ruby
#                    ^ meta.module.ruby
#                     ^^^ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
  module ModOne::ModTwo; @a = 1; end
# ^^^^^^ meta.module.ruby keyword.control.module.begin.ruby
#       ^ meta.module.ruby
#        ^^^^^^ meta.module.ruby entity.name.type.module.ruby entity.other.inherited-class.module.first.ruby
#              ^^ meta.module.ruby entity.name.type.module.ruby entity.other.inherited-class.module.first.ruby punctuation.separator.inheritance.ruby
#                ^^^^^^ meta.module.ruby entity.name.type.module.ruby
#                      ^ meta.module.ruby punctuation.separator.statement.ruby
#                       ^ meta.module.ruby
#                        ^ meta.module.ruby variable.other.readwrite.instance.ruby punctuation.definition.variable.ruby
#                         ^ meta.module.ruby variable.other.readwrite.instance.ruby
#                          ^ meta.module.ruby
#                           ^ meta.module.ruby keyword.operator.assignment.ruby
#                            ^ meta.module.ruby
#                             ^ meta.module.ruby constant.numeric.ruby
#                              ^ meta.module.ruby punctuation.separator.statement.ruby
#                               ^ meta.module.ruby
#                                ^^^ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
  module M module N end end
# ^^^^^^ meta.module.ruby keyword.control.module.begin.ruby
#       ^ meta.module.ruby
#        ^ meta.module.ruby entity.name.type.module.ruby
#         ^ meta.module.ruby
#          ^^^^^^ meta.module.ruby meta.module.ruby keyword.control.module.begin.ruby
#                ^ meta.module.ruby meta.module.ruby
#                 ^ meta.module.ruby meta.module.ruby entity.name.type.module.ruby
#                  ^ meta.module.ruby meta.module.ruby
#                   ^^^ meta.module.ruby meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
#                      ^ meta.module.ruby
#                       ^^^ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
  module M; module N end end
# ^^^^^^ meta.module.ruby keyword.control.module.begin.ruby
#       ^ meta.module.ruby
#        ^ meta.module.ruby entity.name.type.module.ruby
#         ^ meta.module.ruby punctuation.separator.statement.ruby
#          ^ meta.module.ruby
#           ^^^^^^ meta.module.ruby meta.module.ruby keyword.control.module.begin.ruby
#                 ^ meta.module.ruby meta.module.ruby
#                  ^ meta.module.ruby meta.module.ruby entity.name.type.module.ruby
#                   ^ meta.module.ruby meta.module.ruby
#                    ^^^ meta.module.ruby meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
#                       ^ meta.module.ruby
#                        ^^^ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
  (module M module N end end)
# ^ punctuation.section.function.ruby
#  ^^^^^^ meta.module.ruby keyword.control.module.begin.ruby
#        ^ meta.module.ruby
#         ^ meta.module.ruby entity.name.type.module.ruby
#          ^ meta.module.ruby
#           ^^^^^^ meta.module.ruby meta.module.ruby keyword.control.module.begin.ruby
#                 ^ meta.module.ruby meta.module.ruby
#                  ^ meta.module.ruby meta.module.ruby entity.name.type.module.ruby
#                   ^ meta.module.ruby meta.module.ruby
#                    ^^^ meta.module.ruby meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
#                       ^ meta.module.ruby
#                        ^^^ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby
#                           ^ punctuation.section.function.ruby

  # multiline
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^ comment.line.number-sign.ruby
  module Bar
# ^^^^^^ meta.module.ruby keyword.control.module.begin.ruby
#       ^ meta.module.ruby
#        ^^^ meta.module.ruby entity.name.type.module.ruby
    $class = "myclass"
#^^^ meta.module.ruby
#   ^ meta.module.ruby variable.other.readwrite.global.ruby punctuation.definition.variable.ruby
#    ^^^^^ meta.module.ruby variable.other.readwrite.global.ruby
#         ^ meta.module.ruby
#          ^ meta.module.ruby keyword.operator.assignment.ruby
#           ^ meta.module.ruby
#            ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#             ^^^^^^^ meta.module.ruby string.quoted.double.interpolated.ruby
#                    ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    @module = "mymodule"
#^^^ meta.module.ruby
#   ^ meta.module.ruby variable.other.readwrite.instance.ruby punctuation.definition.variable.ruby
#    ^^^^^^ meta.module.ruby variable.other.readwrite.instance.ruby
#          ^ meta.module.ruby
#           ^ meta.module.ruby keyword.operator.assignment.ruby
#            ^ meta.module.ruby
#             ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#              ^^^^^^^^ meta.module.ruby string.quoted.double.interpolated.ruby
#                      ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    class_name = "class_name"
#^^^ meta.module.ruby
#   ^^^^^^^^^^ meta.module.ruby variable.other.ruby
#             ^ meta.module.ruby
#              ^ meta.module.ruby keyword.operator.assignment.ruby
#               ^ meta.module.ruby
#                ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                 ^^^^^^^^^^ meta.module.ruby string.quoted.double.interpolated.ruby
#                           ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    module_name = "module_name"
#^^^ meta.module.ruby
#   ^^^^^^^^^^^ meta.module.ruby variable.other.ruby
#              ^ meta.module.ruby
#               ^ meta.module.ruby keyword.operator.assignment.ruby
#                ^ meta.module.ruby
#                 ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                  ^^^^^^^^^^^ meta.module.ruby string.quoted.double.interpolated.ruby
#                             ^ meta.module.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    class Foo
#^^^ meta.module.ruby
#   ^^^^^ meta.module.ruby meta.class.ruby keyword.control.class.begin.ruby
#        ^ meta.module.ruby meta.class.ruby
#         ^^^ meta.module.ruby meta.class.ruby entity.name.type.class.ruby variable.other.constant.ruby
      @@var = 1
#^^^^^ meta.module.ruby meta.class.ruby
#     ^^ meta.module.ruby meta.class.ruby variable.other.readwrite.class.ruby punctuation.definition.variable.ruby
#       ^^^ meta.module.ruby meta.class.ruby variable.other.readwrite.class.ruby
#          ^ meta.module.ruby meta.class.ruby
#           ^ meta.module.ruby meta.class.ruby keyword.operator.assignment.ruby
#            ^ meta.module.ruby meta.class.ruby
#             ^ meta.module.ruby meta.class.ruby constant.numeric.ruby
    end
#^^^ meta.module.ruby meta.class.ruby
#   ^^^ meta.module.ruby meta.class.ruby keyword.control.end.ruby keyword.control.class.end.ruby
  end
#^ meta.module.ruby
# ^^^ meta.module.ruby keyword.control.end.ruby keyword.control.module.end.ruby

  def a; puts "a"; end
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^^ meta.function.method.without-arguments.ruby support.function.kernel.ruby
#            ^ meta.function.method.without-arguments.ruby
#             ^ meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#              ^ meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby
#               ^ meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#                 ^ meta.function.method.without-arguments.ruby
#                  ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def b; def c; puts "c"; end; end
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#           ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#            ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby entity.name.function.ruby
#             ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#              ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#               ^^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby support.function.kernel.ruby
#                   ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#                    ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                     ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby
#                      ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                       ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#                        ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#                         ^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                            ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#                             ^ meta.function.method.without-arguments.ruby
#                              ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def d; puts self.end; end
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^^ meta.function.method.without-arguments.ruby support.function.kernel.ruby
#            ^ meta.function.method.without-arguments.ruby
#             ^^^^ meta.function.method.without-arguments.ruby variable.language.self.ruby
#                 ^ meta.function.method.without-arguments.ruby punctuation.separator.method.ruby
#                  ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#                     ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#                      ^ meta.function.method.without-arguments.ruby
#                       ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def method; hello, world = [1,2] end # test comment
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#           ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#            ^ meta.function.method.without-arguments.ruby
#             ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#                  ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#                   ^ meta.function.method.without-arguments.ruby
#                    ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#                         ^ meta.function.method.without-arguments.ruby
#                          ^ meta.function.method.without-arguments.ruby keyword.operator.assignment.ruby
#                           ^ meta.function.method.without-arguments.ruby
#                            ^ meta.function.method.without-arguments.ruby punctuation.section.array.begin.ruby
#                             ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                              ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#                               ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                                ^ meta.function.method.without-arguments.ruby punctuation.section.array.end.ruby
#                                 ^ meta.function.method.without-arguments.ruby
#                                  ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                      ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                       ^^^^^^^^^^^^^ comment.line.number-sign.ruby

  # multiline
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^ comment.line.number-sign.ruby
  def e
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    puts "e"
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^ meta.function.method.without-arguments.ruby support.function.kernel.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^ meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#         ^ meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby
#          ^ meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def f
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    def g
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby entity.name.function.ruby
      puts "g"
#^^^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#     ^^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby support.function.kernel.ruby
#         ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#          ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#           ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby
#            ^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    end
#^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def h
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    puts self.end
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^ meta.function.method.without-arguments.ruby support.function.kernel.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^^ meta.function.method.without-arguments.ruby variable.language.self.ruby
#            ^ meta.function.method.without-arguments.ruby punctuation.separator.method.ruby
#             ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def i
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    end?       # self.end?
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#      ^^^^^^^^ meta.function.method.without-arguments.ruby
#              ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#               ^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    end!       # self.end!
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#      ^^^^^^^^ meta.function.method.without-arguments.ruby
#              ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#               ^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method # test comment
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#           ^ meta.function.method.without-arguments.ruby
#            ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#             ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.without-arguments.ruby
#          ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#               ^ meta.function.method.without-arguments.ruby
#                ^ meta.function.method.without-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.without-arguments.ruby
#                  ^ meta.function.method.without-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.without-arguments.ruby punctuation.section.array.end.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def a(arg); puts arg; end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#           ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#            ^ meta.function.method.with-arguments.ruby
#             ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                     ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                      ^ meta.function.method.with-arguments.ruby
#                       ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def b; def c(arg); puts arg; end; end
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#           ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#            ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby entity.name.function.ruby
#             ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#              ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                 ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                  ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                   ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#                    ^^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                        ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#                         ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.other.ruby
#                            ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                             ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#                              ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                 ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#                                  ^ meta.function.method.without-arguments.ruby
#                                   ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def d(arg); puts arg.end; end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#           ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#            ^ meta.function.method.with-arguments.ruby
#             ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                     ^ meta.function.method.with-arguments.ruby punctuation.separator.method.ruby
#                      ^^^ meta.function.method.with-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#                         ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                          ^ meta.function.method.with-arguments.ruby
#                           ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def method_with_parentheses(*a, **b, &c) hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                              ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                     ^ meta.function.method.with-arguments.ruby
#                                      ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                       ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                        ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                         ^ meta.function.method.with-arguments.ruby
#                                          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^ meta.function.method.with-arguments.ruby
#                                                 ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                      ^ meta.function.method.with-arguments.ruby
#                                                       ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                        ^ meta.function.method.with-arguments.ruby
#                                                         ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                          ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                            ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                             ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                              ^ meta.function.method.with-arguments.ruby
#                                                               ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                   ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                    ^^^^^^^^^^^^^ comment.line.number-sign.ruby
  def method_with_parentheses(a, b, c = [foo,bar,baz]) hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby
#                                     ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                      ^ meta.function.method.with-arguments.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                            ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                   ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                                     ^ meta.function.method.with-arguments.ruby
#                                                      ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                            ^ meta.function.method.with-arguments.ruby
#                                                             ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                                  ^ meta.function.method.with-arguments.ruby
#                                                                   ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                    ^ meta.function.method.with-arguments.ruby
#                                                                     ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                          ^ meta.function.method.with-arguments.ruby
#                                                                           ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                               ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                ^^^^^^^^^^^^^ comment.line.number-sign.ruby

  def e(arg)
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
    puts arg
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#       ^ meta.function.method.with-arguments.ruby
#        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def f
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    def g(arg)
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby entity.name.function.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#         ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#            ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
      puts arg
#^^^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#     ^^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby support.function.kernel.ruby
#         ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#          ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.other.ruby
    end
#^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def h(arg)
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
    puts arg.end
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#       ^ meta.function.method.with-arguments.ruby
#        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#           ^ meta.function.method.with-arguments.ruby punctuation.separator.method.ruby
#            ^^^ meta.function.method.with-arguments.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def i(arg)
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
    end?       # self.end?
#^^^ meta.function.method.with-arguments.ruby
#   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#      ^^^^^^^^ meta.function.method.with-arguments.ruby
#              ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#               ^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    end!       # self.end!
#^^^ meta.function.method.with-arguments.ruby
#   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#      ^^^^^^^^ meta.function.method.with-arguments.ruby
#              ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#               ^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_with_parentheses(a, b, c = [foo,bar,baz]) # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby
#                                     ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                      ^ meta.function.method.with-arguments.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                            ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                   ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                                     ^ meta.function.method.with-arguments.ruby
#                                                      ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                       ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_with_parentheses(a, b = "hello", c = ["foo", "bar"], d = (2 + 2) * 2, e = {}) # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby
#                                  ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                   ^ meta.function.method.with-arguments.ruby
#                                    ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                     ^^^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                          ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                            ^ meta.function.method.with-arguments.ruby
#                                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                              ^ meta.function.method.with-arguments.ruby
#                                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                ^ meta.function.method.with-arguments.ruby
#                                                 ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                  ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                   ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                      ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                        ^ meta.function.method.with-arguments.ruby
#                                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                          ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                             ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                              ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                ^ meta.function.method.with-arguments.ruby
#                                                                 ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                  ^ meta.function.method.with-arguments.ruby
#                                                                   ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                    ^ meta.function.method.with-arguments.ruby
#                                                                     ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                       ^ meta.function.method.with-arguments.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby
#                                                                          ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                           ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                                                            ^ meta.function.method.with-arguments.ruby
#                                                                             ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                              ^ meta.function.method.with-arguments.ruby
#                                                                               ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                                ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                                 ^ meta.function.method.with-arguments.ruby
#                                                                                  ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                                   ^ meta.function.method.with-arguments.ruby
#                                                                                    ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                                     ^ meta.function.method.with-arguments.ruby
#                                                                                      ^ meta.function.method.with-arguments.ruby punctuation.section.scope.begin.ruby
#                                                                                       ^ meta.function.method.with-arguments.ruby punctuation.section.scope.end.ruby
#                                                                                        ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                                                                         ^ meta.function.method.with-arguments.ruby
#                                                                                          ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                           ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_with_parentheses(a,
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                              b = hello, # test comment
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                      ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                       ^ meta.function.method.with-arguments.ruby
#                                        ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                         ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
                              c = ["foo", bar, :baz],
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                  ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                   ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                      ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                        ^ meta.function.method.with-arguments.ruby
#                                         ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                            ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                             ^ meta.function.method.with-arguments.ruby
#                                              ^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                               ^^^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                   ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                              d = (2 + 2) * 2,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                  ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                   ^ meta.function.method.with-arguments.ruby
#                                    ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                     ^ meta.function.method.with-arguments.ruby
#                                      ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                        ^ meta.function.method.with-arguments.ruby
#                                         ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                          ^ meta.function.method.with-arguments.ruby
#                                           ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                            ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                              e = {})
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.section.scope.begin.ruby
#                                  ^ meta.function.method.with-arguments.ruby punctuation.section.scope.end.ruby
#                                   ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def a arg; puts arg; end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#           ^ meta.function.method.with-arguments.ruby
#            ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                ^ meta.function.method.with-arguments.ruby
#                 ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                     ^ meta.function.method.with-arguments.ruby
#                      ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def b; def c arg; puts arg; end; end
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#           ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#            ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby entity.name.function.ruby
#             ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#              ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                 ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                  ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#                   ^^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                       ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#                        ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.other.ruby
#                           ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                            ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#                             ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#                                 ^ meta.function.method.without-arguments.ruby
#                                  ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def d arg; puts arg.end; end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#          ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#           ^ meta.function.method.with-arguments.ruby
#            ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                ^ meta.function.method.with-arguments.ruby
#                 ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.method.ruby
#                     ^^^ meta.function.method.with-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#                        ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                         ^ meta.function.method.with-arguments.ruby
#                          ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  def method_without_parentheses a, b, c = [foo,bar,baz]; hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                     ^ meta.function.method.with-arguments.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                       ^ meta.function.method.with-arguments.ruby
#                                        ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                         ^ meta.function.method.with-arguments.ruby
#                                          ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                           ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                               ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                                                        ^ meta.function.method.with-arguments.ruby
#                                                         ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                               ^ meta.function.method.with-arguments.ruby
#                                                                ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                                     ^ meta.function.method.with-arguments.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                       ^ meta.function.method.with-arguments.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                          ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                           ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                            ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                             ^ meta.function.method.with-arguments.ruby
#                                                                              ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                                  ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                   ^^^^^^^^^^^^^ comment.line.number-sign.ruby
  def method_without_parentheses *a, **b, &c; hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                 ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby
#                                    ^^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                        ^ meta.function.method.with-arguments.ruby
#                                         ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                          ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                                            ^ meta.function.method.with-arguments.ruby
#                                             ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                   ^ meta.function.method.with-arguments.ruby
#                                                    ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                         ^ meta.function.method.with-arguments.ruby
#                                                          ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                           ^ meta.function.method.with-arguments.ruby
#                                                            ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                             ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                               ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                 ^ meta.function.method.with-arguments.ruby
#                                                                  ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                      ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                       ^^^^^^^^^^^^^ comment.line.number-sign.ruby

  def e arg
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
    puts arg
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#       ^ meta.function.method.with-arguments.ruby
#        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def f
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    def g arg
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby entity.name.function.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#         ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.parameter.function.ruby
      puts arg
#^^^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#     ^^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby support.function.kernel.ruby
#         ^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#          ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby variable.other.ruby
    end
#^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def h arg
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
    puts arg.end
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#       ^ meta.function.method.with-arguments.ruby
#        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#           ^ meta.function.method.with-arguments.ruby punctuation.separator.method.ruby
#            ^^^ meta.function.method.with-arguments.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def i arg
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#      ^ meta.function.method.with-arguments.ruby
#       ^^^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
    end?       # self.end?
#^^^ meta.function.method.with-arguments.ruby
#   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#      ^^^^^^^^ meta.function.method.with-arguments.ruby
#              ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#               ^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    end!       # self.end!
#^^^ meta.function.method.with-arguments.ruby
#   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#      ^^^^^^^^ meta.function.method.with-arguments.ruby
#              ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#               ^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_without_parentheses a, b, c = [foo,bar,baz] # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                     ^ meta.function.method.with-arguments.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                       ^ meta.function.method.with-arguments.ruby
#                                        ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                         ^ meta.function.method.with-arguments.ruby
#                                          ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                           ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                               ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                       ^ meta.function.method.with-arguments.ruby
#                                                        ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                         ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_without_parentheses a, b = "hello", c = ["foo", "bar"], d = (2 + 2) * 2, e = "" # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby
#                                     ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                      ^ meta.function.method.with-arguments.ruby
#                                       ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                        ^^^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                             ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                               ^ meta.function.method.with-arguments.ruby
#                                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                 ^ meta.function.method.with-arguments.ruby
#                                                  ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                   ^ meta.function.method.with-arguments.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                     ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                      ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                          ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                           ^ meta.function.method.with-arguments.ruby
#                                                            ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                             ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                                ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                 ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                   ^ meta.function.method.with-arguments.ruby
#                                                                    ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                     ^ meta.function.method.with-arguments.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                       ^ meta.function.method.with-arguments.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                          ^ meta.function.method.with-arguments.ruby
#                                                                           ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                            ^ meta.function.method.with-arguments.ruby
#                                                                             ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                              ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                                                               ^ meta.function.method.with-arguments.ruby
#                                                                                ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                                 ^ meta.function.method.with-arguments.ruby
#                                                                                  ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                                   ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                                    ^ meta.function.method.with-arguments.ruby
#                                                                                     ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                                      ^ meta.function.method.with-arguments.ruby
#                                                                                       ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                                        ^ meta.function.method.with-arguments.ruby
#                                                                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                                                          ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                                           ^ meta.function.method.with-arguments.ruby
#                                                                                            ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                             ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_without_parentheses a,    
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^^^^^ meta.function.method.with-arguments.ruby
                                b = "hello"  , # test comment
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                    ^^^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                          ^^ meta.function.method.with-arguments.ruby
#                                            ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                             ^ meta.function.method.with-arguments.ruby
#                                              ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                               ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
                                c = ["foo", bar, :baz],
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                    ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                     ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                        ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                         ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                          ^ meta.function.method.with-arguments.ruby
#                                           ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                               ^ meta.function.method.with-arguments.ruby
#                                                ^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                 ^^^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                     ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                                d = (2 + 2) * 2,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                    ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                     ^ meta.function.method.with-arguments.ruby
#                                      ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                       ^ meta.function.method.with-arguments.ruby
#                                        ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                         ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                          ^ meta.function.method.with-arguments.ruby
#                                           ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                            ^ meta.function.method.with-arguments.ruby
#                                             ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                                e = proc { |e| e + e }  
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                ^ meta.function.method.with-arguments.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                  ^ meta.function.method.with-arguments.ruby
#                                   ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                                       ^ meta.function.method.with-arguments.ruby
#                                        ^ meta.function.method.with-arguments.ruby punctuation.section.scope.begin.ruby
#                                         ^ meta.function.method.with-arguments.ruby meta.syntax.ruby.start-block
#                                          ^ meta.function.method.with-arguments.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                           ^ meta.function.method.with-arguments.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                            ^ meta.function.method.with-arguments.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                             ^ meta.function.method.with-arguments.ruby
#                                              ^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby
#                                                ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                 ^ meta.function.method.with-arguments.ruby
#                                                  ^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                   ^ meta.function.method.with-arguments.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.section.scope.end.ruby
#                                                     ^^^ meta.function.method.with-arguments.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method_without_parentheses *a, **b, &c # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.with-arguments.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                               ^ meta.function.method.with-arguments.ruby
#                                ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                 ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby
#                                    ^^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                        ^ meta.function.method.with-arguments.ruby
#                                         ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                          ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                           ^ meta.function.method.with-arguments.ruby
#                                            ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                             ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#^^^ meta.function.method.with-arguments.ruby
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#         ^ meta.function.method.with-arguments.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#               ^ meta.function.method.with-arguments.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                 ^ meta.function.method.with-arguments.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
  end
#^ meta.function.method.with-arguments.ruby
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  begin puts "foo" end
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#      ^ meta.block.begin.ruby
#       ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#           ^ meta.block.begin.ruby
#            ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#             ^^^ meta.block.begin.ruby string.quoted.double.interpolated.ruby
#                ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                 ^ meta.block.begin.ruby
#                  ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  begin puts "foo"; begin puts "bar" end end
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#      ^ meta.block.begin.ruby
#       ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#           ^ meta.block.begin.ruby
#            ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#             ^^^ meta.block.begin.ruby string.quoted.double.interpolated.ruby
#                ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                 ^ meta.block.begin.ruby punctuation.separator.statement.ruby
#                  ^ meta.block.begin.ruby
#                   ^^^^^ meta.block.begin.ruby meta.block.begin.ruby keyword.control.begin.begin.ruby
#                        ^ meta.block.begin.ruby meta.block.begin.ruby
#                         ^^^^ meta.block.begin.ruby meta.block.begin.ruby support.function.kernel.ruby
#                             ^ meta.block.begin.ruby meta.block.begin.ruby
#                              ^ meta.block.begin.ruby meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                               ^^^ meta.block.begin.ruby meta.block.begin.ruby string.quoted.double.interpolated.ruby
#                                  ^ meta.block.begin.ruby meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                   ^ meta.block.begin.ruby meta.block.begin.ruby
#                                    ^^^ meta.block.begin.ruby meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
#                                       ^ meta.block.begin.ruby
#                                        ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  begin puts self.end end
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#      ^ meta.block.begin.ruby
#       ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#           ^ meta.block.begin.ruby
#            ^^^^ meta.block.begin.ruby variable.language.self.ruby
#                ^ meta.block.begin.ruby punctuation.separator.method.ruby
#                 ^^^ meta.block.begin.ruby meta.function-call.ruby entity.name.function.ruby
#                    ^ meta.block.begin.ruby
#                     ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  begin puts self.end; end
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#      ^ meta.block.begin.ruby
#       ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#           ^ meta.block.begin.ruby
#            ^^^^ meta.block.begin.ruby variable.language.self.ruby
#                ^ meta.block.begin.ruby punctuation.separator.method.ruby
#                 ^^^ meta.block.begin.ruby meta.function-call.ruby entity.name.function.ruby
#                    ^ meta.block.begin.ruby punctuation.separator.statement.ruby
#                     ^ meta.block.begin.ruby
#                      ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  begin puts end? end
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#      ^ meta.block.begin.ruby
#       ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#           ^ meta.block.begin.ruby
#            ^^^ meta.block.begin.ruby variable.other.ruby
#               ^^ meta.block.begin.ruby
#                 ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  begin puts end!; end
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#      ^ meta.block.begin.ruby
#       ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#           ^ meta.block.begin.ruby
#            ^^^ meta.block.begin.ruby variable.other.ruby
#               ^ meta.block.begin.ruby
#                ^ meta.block.begin.ruby punctuation.separator.statement.ruby
#                 ^ meta.block.begin.ruby
#                  ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  if begin true end then true else false end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^^ meta.block.if.ruby meta.block.begin.ruby keyword.control.begin.begin.ruby
#         ^ meta.block.if.ruby meta.block.begin.ruby
#          ^^^^ meta.block.if.ruby meta.block.begin.ruby constant.language.boolean.ruby
#              ^ meta.block.if.ruby meta.block.begin.ruby
#               ^^^ meta.block.if.ruby meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
#                  ^ meta.block.if.ruby
#                   ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                       ^ meta.block.if.ruby
#                        ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                            ^ meta.block.if.ruby
#                             ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                 ^ meta.block.if.ruby
#                                  ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                       ^ meta.block.if.ruby
#                                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  1..begin 10 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#         ^ meta.block.begin.ruby
#          ^^ meta.block.begin.ruby constant.numeric.ruby
#            ^ meta.block.begin.ruby
#             ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  1...begin 10 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
#          ^ meta.block.begin.ruby
#           ^^ meta.block.begin.ruby constant.numeric.ruby
#             ^ meta.block.begin.ruby
#              ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  self.begin puts "foo" end               #shouldn't work
# ^^^^ variable.language.self.ruby
#     ^ punctuation.separator.method.ruby
#      ^^^^^ meta.function-call.ruby entity.name.function.ruby
#            ^^^^ support.function.kernel.ruby
#                 ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                  ^^^ string.quoted.double.interpolated.ruby
#                     ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                       ^^^ keyword.control.end.ruby
#                                         ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                          ^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  self::begin puts "foo" end              #shouldn't work
# ^^^^ variable.language.self.ruby
#     ^^ punctuation.separator.method.ruby
#       ^^^^^ meta.function-call.ruby entity.name.function.ruby
#             ^^^^ support.function.kernel.ruby
#                  ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                   ^^^ string.quoted.double.interpolated.ruby
#                      ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                        ^^^ keyword.control.end.ruby
#                                         ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                          ^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  begin? puts "foo" end                   #shouldn't work
# ^^^^^ variable.other.ruby
#        ^^^^ support.function.kernel.ruby
#             ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#              ^^^ string.quoted.double.interpolated.ruby
#                 ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                   ^^^ keyword.control.end.ruby
#                                         ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                          ^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  begin! puts "foo" end                   #shouldn't work
# ^^^^^ variable.other.ruby
#        ^^^^ support.function.kernel.ruby
#             ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#              ^^^ string.quoted.double.interpolated.ruby
#                 ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                   ^^^ keyword.control.end.ruby
#                                         ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                          ^^^^^^^^^^^^^^ comment.line.number-sign.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    puts "foo"
#^^^ meta.block.begin.ruby
#   ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#       ^ meta.block.begin.ruby
#        ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#         ^^^ meta.block.begin.ruby string.quoted.double.interpolated.ruby
#            ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    puts self.end
#^^^ meta.block.begin.ruby
#   ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#       ^ meta.block.begin.ruby
#        ^^^^ meta.block.begin.ruby variable.language.self.ruby
#            ^ meta.block.begin.ruby punctuation.separator.method.ruby
#             ^^^ meta.block.begin.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    puts end?
#^^^ meta.block.begin.ruby
#   ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#       ^ meta.block.begin.ruby
#        ^^^ meta.block.begin.ruby variable.other.ruby
#           ^^ meta.block.begin.ruby
    puts end!
#^^^ meta.block.begin.ruby
#   ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#       ^ meta.block.begin.ruby
#        ^^^ meta.block.begin.ruby variable.other.ruby
#           ^^ meta.block.begin.ruby
  end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    puts "foo"
#^^^ meta.block.begin.ruby
#   ^^^^ meta.block.begin.ruby support.function.kernel.ruby
#       ^ meta.block.begin.ruby
#        ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#         ^^^ meta.block.begin.ruby string.quoted.double.interpolated.ruby
#            ^ meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    begin
#^^^ meta.block.begin.ruby
#   ^^^^^ meta.block.begin.ruby meta.block.begin.ruby keyword.control.begin.begin.ruby
      puts "bar"
#^^^^^ meta.block.begin.ruby meta.block.begin.ruby
#     ^^^^ meta.block.begin.ruby meta.block.begin.ruby support.function.kernel.ruby
#         ^ meta.block.begin.ruby meta.block.begin.ruby
#          ^ meta.block.begin.ruby meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#           ^^^ meta.block.begin.ruby meta.block.begin.ruby string.quoted.double.interpolated.ruby
#              ^ meta.block.begin.ruby meta.block.begin.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
    end
#^^^ meta.block.begin.ruby meta.block.begin.ruby
#   ^^^ meta.block.begin.ruby meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
  end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  3.times.map do 1 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^^^^^ meta.function-call.ruby entity.name.function.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^ meta.function-call.ruby entity.name.function.ruby
#             ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#               ^ meta.block.do.ruby
#                ^ meta.block.do.ruby constant.numeric.ruby
#                 ^ meta.block.do.ruby
#                  ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
  3.times.map do || 1 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^^^^^ meta.function-call.ruby entity.name.function.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^ meta.function-call.ruby entity.name.function.ruby
#             ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#               ^ meta.block.do.ruby
#                ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                 ^ meta.block.do.ruby meta.block.parameters.ruby
#                  ^ meta.block.do.ruby
#                   ^ meta.block.do.ruby constant.numeric.ruby
#                    ^ meta.block.do.ruby
#                     ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
  3.times.map do |e, x=1| e + x end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^^^^^ meta.function-call.ruby entity.name.function.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^ meta.function-call.ruby entity.name.function.ruby
#             ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#               ^ meta.block.do.ruby
#                ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                 ^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                  ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                   ^ meta.block.do.ruby meta.block.parameters.ruby
#                    ^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                     ^^ meta.block.do.ruby meta.block.parameters.ruby
#                       ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                        ^ meta.block.do.ruby
#                         ^ meta.block.do.ruby variable.other.ruby
#                          ^ meta.block.do.ruby
#                           ^ meta.block.do.ruby keyword.operator.arithmetic.ruby
#                            ^ meta.block.do.ruby
#                             ^ meta.block.do.ruby variable.other.ruby
#                              ^ meta.block.do.ruby
#                               ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
  [(0..10), (10..20)].map do |r| r.end end
# ^ punctuation.section.array.begin.ruby
#  ^ punctuation.section.function.ruby
#   ^ constant.numeric.ruby
#    ^ punctuation.separator.method.ruby
#     ^ punctuation.separator.method.ruby
#      ^^ constant.numeric.ruby
#        ^ punctuation.section.function.ruby
#         ^ punctuation.separator.object.ruby
#           ^ punctuation.section.function.ruby
#            ^^ constant.numeric.ruby
#              ^ punctuation.separator.method.ruby
#               ^ punctuation.separator.method.ruby
#                ^^ constant.numeric.ruby
#                  ^ punctuation.section.function.ruby
#                   ^ punctuation.section.array.end.ruby
#                    ^ punctuation.separator.method.ruby
#                     ^^^ meta.function-call.ruby entity.name.function.ruby
#                         ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#                           ^ meta.block.do.ruby
#                            ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                             ^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                              ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                               ^ meta.block.do.ruby
#                                ^ meta.block.do.ruby variable.other.ruby
#                                 ^ meta.block.do.ruby punctuation.separator.method.ruby
#                                  ^^^ meta.block.do.ruby meta.function-call.ruby entity.name.function.ruby
#                                     ^ meta.block.do.ruby
#                                      ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
  any_method do? 1 end                        #shouldn't work
# ^^^^^^^^^^ variable.other.ruby
#            ^^ variable.other.ruby
#                ^ constant.numeric.ruby
#                  ^^^ keyword.control.end.ruby
#                                             ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                              ^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  any_method do! 1 end                        #shouldn't work
# ^^^^^^^^^^ variable.other.ruby
#            ^^ variable.other.ruby
#                ^ constant.numeric.ruby
#                  ^^^ keyword.control.end.ruby
#                                             ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                              ^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  self.do 1 end                               #shouldn't work
# ^^^^ variable.language.self.ruby
#     ^ punctuation.separator.method.ruby
#      ^^ meta.function-call.ruby entity.name.function.ruby
#         ^ constant.numeric.ruby
#           ^^^ keyword.control.end.ruby
#                                             ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                              ^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  self::do 1 end                              #shouldn't work
# ^^^^ variable.language.self.ruby
#     ^^ punctuation.separator.method.ruby
#       ^^ meta.function-call.ruby entity.name.function.ruby
#          ^ constant.numeric.ruby
#            ^^^ keyword.control.end.ruby
#                                             ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                              ^^^^^^^^^^^^^^ comment.line.number-sign.ruby

  [1,2,3].map do |element|
# ^ punctuation.section.array.begin.ruby
#  ^ constant.numeric.ruby
#   ^ punctuation.separator.object.ruby
#    ^ constant.numeric.ruby
#     ^ punctuation.separator.object.ruby
#      ^ constant.numeric.ruby
#       ^ punctuation.section.array.end.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^ meta.function-call.ruby entity.name.function.ruby
#             ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#               ^ meta.block.do.ruby
#                ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                 ^^^^^^^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                        ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
    element + 1
#^^^ meta.block.do.ruby
#   ^^^^^^^ meta.block.do.ruby variable.other.ruby
#          ^ meta.block.do.ruby
#           ^ meta.block.do.ruby keyword.operator.arithmetic.ruby
#            ^ meta.block.do.ruby
#             ^ meta.block.do.ruby constant.numeric.ruby
  end
#^ meta.block.do.ruby
# ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby

  [[1],[2],[3]].each do |element|
# ^ punctuation.section.array.begin.ruby
#  ^ punctuation.section.array.begin.ruby
#   ^ constant.numeric.ruby
#    ^ punctuation.section.array.end.ruby
#     ^ punctuation.separator.object.ruby
#      ^ punctuation.section.array.begin.ruby
#       ^ constant.numeric.ruby
#        ^ punctuation.section.array.end.ruby
#         ^ punctuation.separator.object.ruby
#          ^ punctuation.section.array.begin.ruby
#           ^ constant.numeric.ruby
#            ^ punctuation.section.array.end.ruby
#             ^ punctuation.section.array.end.ruby
#              ^ punctuation.separator.method.ruby
#               ^^^^ meta.function-call.ruby entity.name.function.ruby
#                    ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#                      ^ meta.block.do.ruby
#                       ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                        ^^^^^^^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                               ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
    element.each do |subelement|
#^^^ meta.block.do.ruby
#   ^^^^^^^ meta.block.do.ruby variable.other.ruby
#          ^ meta.block.do.ruby punctuation.separator.method.ruby
#           ^^^^ meta.block.do.ruby meta.function-call.ruby entity.name.function.ruby
#               ^ meta.block.do.ruby
#                ^^ meta.block.do.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                  ^ meta.block.do.ruby meta.block.do.ruby
#                   ^ meta.block.do.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                    ^^^^^^^^^^ meta.block.do.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                              ^ meta.block.do.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
      puts subelement
#^^^^^ meta.block.do.ruby meta.block.do.ruby
#     ^^^^ meta.block.do.ruby meta.block.do.ruby support.function.kernel.ruby
#         ^ meta.block.do.ruby meta.block.do.ruby
#          ^^^^^^^^^^ meta.block.do.ruby meta.block.do.ruby variable.other.ruby
    end
#^^^ meta.block.do.ruby meta.block.do.ruby
#   ^^^ meta.block.do.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
  end
#^ meta.block.do.ruby
# ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby

  [(0..10), (10..20)].map do |r|
# ^ punctuation.section.array.begin.ruby
#  ^ punctuation.section.function.ruby
#   ^ constant.numeric.ruby
#    ^ punctuation.separator.method.ruby
#     ^ punctuation.separator.method.ruby
#      ^^ constant.numeric.ruby
#        ^ punctuation.section.function.ruby
#         ^ punctuation.separator.object.ruby
#           ^ punctuation.section.function.ruby
#            ^^ constant.numeric.ruby
#              ^ punctuation.separator.method.ruby
#               ^ punctuation.separator.method.ruby
#                ^^ constant.numeric.ruby
#                  ^ punctuation.section.function.ruby
#                   ^ punctuation.section.array.end.ruby
#                    ^ punctuation.separator.method.ruby
#                     ^^^ meta.function-call.ruby entity.name.function.ruby
#                         ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#                           ^ meta.block.do.ruby
#                            ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                             ^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                              ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
    r.end
#^^^ meta.block.do.ruby
#   ^ meta.block.do.ruby variable.other.ruby
#    ^ meta.block.do.ruby punctuation.separator.method.ruby
#     ^^^ meta.block.do.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.block.do.ruby
# ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby

  [].each do |e|
# ^ punctuation.section.array.begin.ruby
#  ^ punctuation.section.array.end.ruby
#   ^ punctuation.separator.method.ruby
#    ^^^^ meta.function-call.ruby entity.name.function.ruby
#         ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#           ^ meta.block.do.ruby
#            ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#             ^ meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#              ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
    e + end? - end!
#^^^ meta.block.do.ruby
#   ^ meta.block.do.ruby variable.other.ruby
#    ^ meta.block.do.ruby
#     ^ meta.block.do.ruby keyword.operator.arithmetic.ruby
#      ^ meta.block.do.ruby
#       ^^^ meta.block.do.ruby variable.other.ruby
#          ^^ meta.block.do.ruby
#            ^ meta.block.do.ruby keyword.operator.arithmetic.ruby
#             ^ meta.block.do.ruby
#              ^^^ meta.block.do.ruby variable.other.ruby
#                 ^^ meta.block.do.ruby
  end
#^ meta.block.do.ruby
# ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby

  3.times do
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^^^^^ meta.function-call.ruby entity.name.function.ruby
#         ^^ meta.block.do.ruby keyword.control.do.begin.ruby
    puts "foo"
#^^^ meta.block.do.ruby
#   ^^^^ meta.block.do.ruby support.function.kernel.ruby
#       ^ meta.block.do.ruby
#        ^ meta.block.do.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#         ^^^ meta.block.do.ruby string.quoted.double.interpolated.ruby
#            ^ meta.block.do.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  end
#^ meta.block.do.ruby
# ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby

  3.times do ||
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^^^^^ meta.function-call.ruby entity.name.function.ruby
#         ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#           ^ meta.block.do.ruby
#            ^ meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#             ^ meta.block.do.ruby meta.block.parameters.ruby
    puts "bar"
#^^^ meta.block.do.ruby
#   ^^^^ meta.block.do.ruby support.function.kernel.ruby
#       ^ meta.block.do.ruby
#        ^ meta.block.do.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#         ^^^ meta.block.do.ruby string.quoted.double.interpolated.ruby
#            ^ meta.block.do.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  end
#^ meta.block.do.ruby
# ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby

  # -------------------------------------------
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  # Testarea for for-loop
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  # -------------------------------------------
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.ruby

  # singleline
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^^ comment.line.number-sign.ruby
  for i in for j in [[1,2]] do break j; end do puts i; end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby meta.block.for.ruby
#              ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby meta.block.for.ruby
#                ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby meta.block.for.ruby
#                   ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                    ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                     ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                      ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.object.ruby
#                       ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                        ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                         ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                          ^ meta.block.for.ruby meta.block.for.ruby
#                           ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.optional.do.ruby
#                             ^ meta.block.for.ruby meta.block.for.ruby
#                              ^^^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                   ^ meta.block.for.ruby meta.block.for.ruby
#                                    ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#                                     ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                      ^ meta.block.for.ruby meta.block.for.ruby
#                                       ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                          ^ meta.block.for.ruby
#                                           ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                                             ^ meta.block.for.ruby
#                                              ^^^^ meta.block.for.ruby support.function.kernel.ruby
#                                                  ^ meta.block.for.ruby
#                                                   ^ meta.block.for.ruby variable.other.ruby
#                                                    ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                     ^ meta.block.for.ruby
#                                                      ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  for i in for j in [[1,2]] do break j; end do [i].map do |e| e end; end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby meta.block.for.ruby
#              ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby meta.block.for.ruby
#                ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby meta.block.for.ruby
#                   ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                    ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                     ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                      ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.object.ruby
#                       ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                        ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                         ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                          ^ meta.block.for.ruby meta.block.for.ruby
#                           ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.optional.do.ruby
#                             ^ meta.block.for.ruby meta.block.for.ruby
#                              ^^^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                   ^ meta.block.for.ruby meta.block.for.ruby
#                                    ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#                                     ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                      ^ meta.block.for.ruby meta.block.for.ruby
#                                       ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                          ^ meta.block.for.ruby
#                                           ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                                             ^ meta.block.for.ruby
#                                              ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                               ^ meta.block.for.ruby variable.other.ruby
#                                                ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                                 ^ meta.block.for.ruby punctuation.separator.method.ruby
#                                                  ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                                                     ^ meta.block.for.ruby
#                                                      ^^ meta.block.for.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                                                        ^ meta.block.for.ruby meta.block.do.ruby
#                                                         ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                          ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                                           ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                            ^ meta.block.for.ruby meta.block.do.ruby
#                                                             ^ meta.block.for.ruby meta.block.do.ruby variable.other.ruby
#                                                              ^ meta.block.for.ruby meta.block.do.ruby
#                                                               ^^^ meta.block.for.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                                                  ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                                   ^ meta.block.for.ruby
#                                                                    ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  for i in for j in [[1,2]]; break j; end; [i].map do |e| e end; end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby meta.block.for.ruby
#              ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby meta.block.for.ruby
#                ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby meta.block.for.ruby
#                   ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                    ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                     ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                      ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.object.ruby
#                       ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                        ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                         ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                          ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                           ^ meta.block.for.ruby meta.block.for.ruby
#                            ^^^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                 ^ meta.block.for.ruby meta.block.for.ruby
#                                  ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#                                   ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                    ^ meta.block.for.ruby meta.block.for.ruby
#                                     ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                        ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                         ^ meta.block.for.ruby
#                                          ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                           ^ meta.block.for.ruby variable.other.ruby
#                                            ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                             ^ meta.block.for.ruby punctuation.separator.method.ruby
#                                              ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                                                 ^ meta.block.for.ruby
#                                                  ^^ meta.block.for.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                                                    ^ meta.block.for.ruby meta.block.do.ruby
#                                                     ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                      ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                                       ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                        ^ meta.block.for.ruby meta.block.do.ruby
#                                                         ^ meta.block.for.ruby meta.block.do.ruby variable.other.ruby
#                                                          ^ meta.block.for.ruby meta.block.do.ruby
#                                                           ^^^ meta.block.for.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                                              ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                               ^ meta.block.for.ruby
#                                                                ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  for i in for j in if true then [[1,2]] else [[3,4]] end; break j; end; [i].map do |e| e end; end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby meta.block.for.ruby
#              ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby meta.block.for.ruby
#                ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                   ^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                     ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                      ^^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.language.boolean.ruby
#                          ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                           ^^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.conditional.then.ruby
#                               ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                                 ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                                  ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                   ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.separator.object.ruby
#                                    ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                     ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                      ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                       ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                        ^^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                                            ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                             ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                                              ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                                               ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                                ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.separator.object.ruby
#                                                 ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                                  ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                                   ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                                    ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                                     ^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                                        ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                                         ^ meta.block.for.ruby meta.block.for.ruby
#                                                          ^^^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                                               ^ meta.block.for.ruby meta.block.for.ruby
#                                                                ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#                                                                 ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                                                  ^ meta.block.for.ruby meta.block.for.ruby
#                                                                   ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                                      ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                                       ^ meta.block.for.ruby
#                                                                        ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                                                         ^ meta.block.for.ruby variable.other.ruby
#                                                                          ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                                                           ^ meta.block.for.ruby punctuation.separator.method.ruby
#                                                                            ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                               ^ meta.block.for.ruby
#                                                                                ^^ meta.block.for.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                                                                                  ^ meta.block.for.ruby meta.block.do.ruby
#                                                                                   ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                                                    ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                                                                     ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                                                      ^ meta.block.for.ruby meta.block.do.ruby
#                                                                                       ^ meta.block.for.ruby meta.block.do.ruby variable.other.ruby
#                                                                                        ^ meta.block.for.ruby meta.block.do.ruby
#                                                                                         ^^^ meta.block.for.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                                                                            ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                                                             ^ meta.block.for.ruby
#                                                                                              ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  for i in for j in if true; [[1,2]] else [[3,4]] end; break j; end; [i].map do |e| e end; end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby meta.block.for.ruby
#              ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby meta.block.for.ruby
#                ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                   ^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                     ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                      ^^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.language.boolean.ruby
#                          ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.separator.statement.ruby
#                           ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                            ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                             ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                              ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                               ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.separator.object.ruby
#                                ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                 ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                  ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                   ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                    ^^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                                        ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                         ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                                          ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#                                           ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                            ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.separator.object.ruby
#                                             ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby constant.numeric.ruby
#                                              ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                               ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                                                ^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby
#                                                 ^^^ meta.block.for.ruby meta.block.for.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                                    ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                                     ^ meta.block.for.ruby meta.block.for.ruby
#                                                      ^^^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                                           ^ meta.block.for.ruby meta.block.for.ruby
#                                                            ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#                                                             ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                                              ^ meta.block.for.ruby meta.block.for.ruby
#                                                               ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                                  ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                                   ^ meta.block.for.ruby
#                                                                    ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                                                     ^ meta.block.for.ruby variable.other.ruby
#                                                                      ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                                                       ^ meta.block.for.ruby punctuation.separator.method.ruby
#                                                                        ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                           ^ meta.block.for.ruby
#                                                                            ^^ meta.block.for.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                                                                              ^ meta.block.for.ruby meta.block.do.ruby
#                                                                               ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                                                ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                                                                 ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                                                                  ^ meta.block.for.ruby meta.block.do.ruby
#                                                                                   ^ meta.block.for.ruby meta.block.do.ruby variable.other.ruby
#                                                                                    ^ meta.block.for.ruby meta.block.do.ruby
#                                                                                     ^^^ meta.block.for.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                                                                        ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                                                                         ^ meta.block.for.ruby
#                                                                                          ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  for i in [(0..10), (10..20)] do break i.end end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#           ^ meta.block.for.ruby punctuation.section.function.ruby
#            ^ meta.block.for.ruby constant.numeric.ruby
#             ^ meta.block.for.ruby punctuation.separator.method.ruby
#              ^ meta.block.for.ruby punctuation.separator.method.ruby
#               ^^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.section.function.ruby
#                  ^ meta.block.for.ruby punctuation.separator.object.ruby
#                   ^ meta.block.for.ruby
#                    ^ meta.block.for.ruby punctuation.section.function.ruby
#                     ^^ meta.block.for.ruby constant.numeric.ruby
#                       ^ meta.block.for.ruby punctuation.separator.method.ruby
#                        ^ meta.block.for.ruby punctuation.separator.method.ruby
#                         ^^ meta.block.for.ruby constant.numeric.ruby
#                           ^ meta.block.for.ruby punctuation.section.function.ruby
#                            ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                             ^ meta.block.for.ruby
#                              ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                                ^ meta.block.for.ruby
#                                 ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                      ^ meta.block.for.ruby
#                                       ^ meta.block.for.ruby variable.other.ruby
#                                        ^ meta.block.for.ruby punctuation.separator.method.ruby
#                                         ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                                            ^ meta.block.for.ruby
#                                             ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  for i in [] do puts end?; puts end! end
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#           ^ meta.block.for.ruby punctuation.section.array.end.ruby
#            ^ meta.block.for.ruby
#             ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#               ^ meta.block.for.ruby
#                ^^^^ meta.block.for.ruby support.function.kernel.ruby
#                    ^ meta.block.for.ruby
#                     ^^^ meta.block.for.ruby variable.other.ruby
#                        ^ meta.block.for.ruby
#                         ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                          ^ meta.block.for.ruby
#                           ^^^^ meta.block.for.ruby support.function.kernel.ruby
#                               ^ meta.block.for.ruby
#                                ^^^ meta.block.for.ruby variable.other.ruby
#                                   ^^ meta.block.for.ruby
#                                     ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  1..for i in [1,2,3] do break i if i == 2; end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#       ^ meta.block.for.ruby
#        ^ meta.block.for.ruby variable.other.ruby
#         ^ meta.block.for.ruby
#          ^^ meta.block.for.ruby keyword.control.in.ruby
#            ^ meta.block.for.ruby
#             ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#              ^ meta.block.for.ruby constant.numeric.ruby
#               ^ meta.block.for.ruby punctuation.separator.object.ruby
#                ^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.separator.object.ruby
#                  ^ meta.block.for.ruby constant.numeric.ruby
#                   ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                    ^ meta.block.for.ruby
#                     ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                       ^ meta.block.for.ruby
#                        ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                             ^ meta.block.for.ruby
#                              ^ meta.block.for.ruby variable.other.ruby
#                               ^ meta.block.for.ruby
#                                ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                  ^ meta.block.for.ruby
#                                   ^ meta.block.for.ruby variable.other.ruby
#                                    ^ meta.block.for.ruby
#                                     ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                       ^ meta.block.for.ruby
#                                        ^ meta.block.for.ruby constant.numeric.ruby
#                                         ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                          ^ meta.block.for.ruby
#                                           ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  1...for i in [1,2,3] do break i if i == 2; end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#        ^ meta.block.for.ruby
#         ^ meta.block.for.ruby variable.other.ruby
#          ^ meta.block.for.ruby
#           ^^ meta.block.for.ruby keyword.control.in.ruby
#             ^ meta.block.for.ruby
#              ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#               ^ meta.block.for.ruby constant.numeric.ruby
#                ^ meta.block.for.ruby punctuation.separator.object.ruby
#                 ^ meta.block.for.ruby constant.numeric.ruby
#                  ^ meta.block.for.ruby punctuation.separator.object.ruby
#                   ^ meta.block.for.ruby constant.numeric.ruby
#                    ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                     ^ meta.block.for.ruby
#                      ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                        ^ meta.block.for.ruby
#                         ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                              ^ meta.block.for.ruby
#                               ^ meta.block.for.ruby variable.other.ruby
#                                ^ meta.block.for.ruby
#                                 ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                   ^ meta.block.for.ruby
#                                    ^ meta.block.for.ruby variable.other.ruby
#                                     ^ meta.block.for.ruby
#                                      ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                        ^ meta.block.for.ruby
#                                         ^ meta.block.for.ruby constant.numeric.ruby
#                                          ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                           ^ meta.block.for.ruby
#                                            ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  10 / for i in [1,2,3] do break i if i == 2; end
# ^^ constant.numeric.ruby
#    ^ keyword.operator.arithmetic.ruby
#      ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby variable.other.ruby
#           ^ meta.block.for.ruby
#            ^^ meta.block.for.ruby keyword.control.in.ruby
#              ^ meta.block.for.ruby
#               ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                ^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.separator.object.ruby
#                  ^ meta.block.for.ruby constant.numeric.ruby
#                   ^ meta.block.for.ruby punctuation.separator.object.ruby
#                    ^ meta.block.for.ruby constant.numeric.ruby
#                     ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                      ^ meta.block.for.ruby
#                       ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                         ^ meta.block.for.ruby
#                          ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                               ^ meta.block.for.ruby
#                                ^ meta.block.for.ruby variable.other.ruby
#                                 ^ meta.block.for.ruby
#                                  ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                    ^ meta.block.for.ruby
#                                     ^ meta.block.for.ruby variable.other.ruby
#                                      ^ meta.block.for.ruby
#                                       ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                         ^ meta.block.for.ruby
#                                          ^ meta.block.for.ruby constant.numeric.ruby
#                                           ^ meta.block.for.ruby punctuation.separator.statement.ruby
#                                            ^ meta.block.for.ruby
#                                             ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
  [for i in [1,2,3] do break i if i == 2 end]
# ^ punctuation.section.array.begin.ruby
#  ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#     ^ meta.block.for.ruby
#      ^ meta.block.for.ruby variable.other.ruby
#       ^ meta.block.for.ruby
#        ^^ meta.block.for.ruby keyword.control.in.ruby
#          ^ meta.block.for.ruby
#           ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#            ^ meta.block.for.ruby constant.numeric.ruby
#             ^ meta.block.for.ruby punctuation.separator.object.ruby
#              ^ meta.block.for.ruby constant.numeric.ruby
#               ^ meta.block.for.ruby punctuation.separator.object.ruby
#                ^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                  ^ meta.block.for.ruby
#                   ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                     ^ meta.block.for.ruby
#                      ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                           ^ meta.block.for.ruby
#                            ^ meta.block.for.ruby variable.other.ruby
#                             ^ meta.block.for.ruby
#                              ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                ^ meta.block.for.ruby
#                                 ^ meta.block.for.ruby variable.other.ruby
#                                  ^ meta.block.for.ruby
#                                   ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                     ^ meta.block.for.ruby
#                                      ^ meta.block.for.ruby constant.numeric.ruby
#                                       ^ meta.block.for.ruby
#                                        ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                           ^ punctuation.section.array.end.ruby
  [ for i in [1,2,3] do break i if i == 2 end, for i in [1,2,3] do break i if i == 3 end]
# ^ punctuation.section.array.begin.ruby
#   ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#      ^ meta.block.for.ruby
#       ^ meta.block.for.ruby variable.other.ruby
#        ^ meta.block.for.ruby
#         ^^ meta.block.for.ruby keyword.control.in.ruby
#           ^ meta.block.for.ruby
#            ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#             ^ meta.block.for.ruby constant.numeric.ruby
#              ^ meta.block.for.ruby punctuation.separator.object.ruby
#               ^ meta.block.for.ruby constant.numeric.ruby
#                ^ meta.block.for.ruby punctuation.separator.object.ruby
#                 ^ meta.block.for.ruby constant.numeric.ruby
#                  ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                   ^ meta.block.for.ruby
#                    ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                      ^ meta.block.for.ruby
#                       ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                            ^ meta.block.for.ruby
#                             ^ meta.block.for.ruby variable.other.ruby
#                              ^ meta.block.for.ruby
#                               ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                 ^ meta.block.for.ruby
#                                  ^ meta.block.for.ruby variable.other.ruby
#                                   ^ meta.block.for.ruby
#                                    ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                      ^ meta.block.for.ruby
#                                       ^ meta.block.for.ruby constant.numeric.ruby
#                                        ^ meta.block.for.ruby
#                                         ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                            ^ punctuation.separator.object.ruby
#                                              ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#                                                 ^ meta.block.for.ruby
#                                                  ^ meta.block.for.ruby variable.other.ruby
#                                                   ^ meta.block.for.ruby
#                                                    ^^ meta.block.for.ruby keyword.control.in.ruby
#                                                      ^ meta.block.for.ruby
#                                                       ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                                        ^ meta.block.for.ruby constant.numeric.ruby
#                                                         ^ meta.block.for.ruby punctuation.separator.object.ruby
#                                                          ^ meta.block.for.ruby constant.numeric.ruby
#                                                           ^ meta.block.for.ruby punctuation.separator.object.ruby
#                                                            ^ meta.block.for.ruby constant.numeric.ruby
#                                                             ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                                              ^ meta.block.for.ruby
#                                                               ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                                                                 ^ meta.block.for.ruby
#                                                                  ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                                                       ^ meta.block.for.ruby
#                                                                        ^ meta.block.for.ruby variable.other.ruby
#                                                                         ^ meta.block.for.ruby
#                                                                          ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                                                            ^ meta.block.for.ruby
#                                                                             ^ meta.block.for.ruby variable.other.ruby
#                                                                              ^ meta.block.for.ruby
#                                                                               ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                                                                 ^ meta.block.for.ruby
#                                                                                  ^ meta.block.for.ruby constant.numeric.ruby
#                                                                                   ^ meta.block.for.ruby
#                                                                                    ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                                                       ^ punctuation.section.array.end.ruby
  {for i in [1,2,3] do break i if i == 2 end => 1}
# ^ punctuation.section.scope.begin.ruby
#  ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#     ^ meta.block.for.ruby
#      ^ meta.block.for.ruby variable.other.ruby
#       ^ meta.block.for.ruby
#        ^^ meta.block.for.ruby keyword.control.in.ruby
#          ^ meta.block.for.ruby
#           ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#            ^ meta.block.for.ruby constant.numeric.ruby
#             ^ meta.block.for.ruby punctuation.separator.object.ruby
#              ^ meta.block.for.ruby constant.numeric.ruby
#               ^ meta.block.for.ruby punctuation.separator.object.ruby
#                ^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                  ^ meta.block.for.ruby
#                   ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                     ^ meta.block.for.ruby
#                      ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                           ^ meta.block.for.ruby
#                            ^ meta.block.for.ruby variable.other.ruby
#                             ^ meta.block.for.ruby
#                              ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                ^ meta.block.for.ruby
#                                 ^ meta.block.for.ruby variable.other.ruby
#                                  ^ meta.block.for.ruby
#                                   ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                     ^ meta.block.for.ruby
#                                      ^ meta.block.for.ruby constant.numeric.ruby
#                                       ^ meta.block.for.ruby
#                                        ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                            ^^ punctuation.separator.key-value
#                                               ^ constant.numeric.ruby
#                                                ^ punctuation.section.scope.end.ruby
  { for i in [1,2,3] do break i if i == 2 end => 1 }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#      ^ meta.block.for.ruby
#       ^ meta.block.for.ruby variable.other.ruby
#        ^ meta.block.for.ruby
#         ^^ meta.block.for.ruby keyword.control.in.ruby
#           ^ meta.block.for.ruby
#            ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#             ^ meta.block.for.ruby constant.numeric.ruby
#              ^ meta.block.for.ruby punctuation.separator.object.ruby
#               ^ meta.block.for.ruby constant.numeric.ruby
#                ^ meta.block.for.ruby punctuation.separator.object.ruby
#                 ^ meta.block.for.ruby constant.numeric.ruby
#                  ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                   ^ meta.block.for.ruby
#                    ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                      ^ meta.block.for.ruby
#                       ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                            ^ meta.block.for.ruby
#                             ^ meta.block.for.ruby variable.other.ruby
#                              ^ meta.block.for.ruby
#                               ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                 ^ meta.block.for.ruby
#                                  ^ meta.block.for.ruby variable.other.ruby
#                                   ^ meta.block.for.ruby
#                                    ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                      ^ meta.block.for.ruby
#                                       ^ meta.block.for.ruby constant.numeric.ruby
#                                        ^ meta.block.for.ruby
#                                         ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                             ^^ punctuation.separator.key-value
#                                                ^ constant.numeric.ruby
#                                                  ^ punctuation.section.scope.end.ruby
  {foo: for i in [1,2,3] do break i if i == 2 end}
# ^ punctuation.section.scope.begin.ruby
#  ^^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#          ^ meta.block.for.ruby
#           ^ meta.block.for.ruby variable.other.ruby
#            ^ meta.block.for.ruby
#             ^^ meta.block.for.ruby keyword.control.in.ruby
#               ^ meta.block.for.ruby
#                ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                 ^ meta.block.for.ruby constant.numeric.ruby
#                  ^ meta.block.for.ruby punctuation.separator.object.ruby
#                   ^ meta.block.for.ruby constant.numeric.ruby
#                    ^ meta.block.for.ruby punctuation.separator.object.ruby
#                     ^ meta.block.for.ruby constant.numeric.ruby
#                      ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                       ^ meta.block.for.ruby
#                        ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                          ^ meta.block.for.ruby
#                           ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                ^ meta.block.for.ruby
#                                 ^ meta.block.for.ruby variable.other.ruby
#                                  ^ meta.block.for.ruby
#                                   ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                     ^ meta.block.for.ruby
#                                      ^ meta.block.for.ruby variable.other.ruby
#                                       ^ meta.block.for.ruby
#                                        ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                          ^ meta.block.for.ruby
#                                           ^ meta.block.for.ruby constant.numeric.ruby
#                                            ^ meta.block.for.ruby
#                                             ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                ^ punctuation.section.scope.end.ruby
  { foo: for i in [1,2,3] do break i if i == 2 end, bar: for i in [1,2,3] do break i if i == 3 end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#        ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#           ^ meta.block.for.ruby
#            ^ meta.block.for.ruby variable.other.ruby
#             ^ meta.block.for.ruby
#              ^^ meta.block.for.ruby keyword.control.in.ruby
#                ^ meta.block.for.ruby
#                 ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                  ^ meta.block.for.ruby constant.numeric.ruby
#                   ^ meta.block.for.ruby punctuation.separator.object.ruby
#                    ^ meta.block.for.ruby constant.numeric.ruby
#                     ^ meta.block.for.ruby punctuation.separator.object.ruby
#                      ^ meta.block.for.ruby constant.numeric.ruby
#                       ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                        ^ meta.block.for.ruby
#                         ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                           ^ meta.block.for.ruby
#                            ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                 ^ meta.block.for.ruby
#                                  ^ meta.block.for.ruby variable.other.ruby
#                                   ^ meta.block.for.ruby
#                                    ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                      ^ meta.block.for.ruby
#                                       ^ meta.block.for.ruby variable.other.ruby
#                                        ^ meta.block.for.ruby
#                                         ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                           ^ meta.block.for.ruby
#                                            ^ meta.block.for.ruby constant.numeric.ruby
#                                             ^ meta.block.for.ruby
#                                              ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                 ^ punctuation.separator.object.ruby
#                                                   ^^^ constant.language.symbol.hashkey.ruby
#                                                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                        ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#                                                           ^ meta.block.for.ruby
#                                                            ^ meta.block.for.ruby variable.other.ruby
#                                                             ^ meta.block.for.ruby
#                                                              ^^ meta.block.for.ruby keyword.control.in.ruby
#                                                                ^ meta.block.for.ruby
#                                                                 ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                                                  ^ meta.block.for.ruby constant.numeric.ruby
#                                                                   ^ meta.block.for.ruby punctuation.separator.object.ruby
#                                                                    ^ meta.block.for.ruby constant.numeric.ruby
#                                                                     ^ meta.block.for.ruby punctuation.separator.object.ruby
#                                                                      ^ meta.block.for.ruby constant.numeric.ruby
#                                                                       ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                                                        ^ meta.block.for.ruby
#                                                                         ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                                                                           ^ meta.block.for.ruby
#                                                                            ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                                                                 ^ meta.block.for.ruby
#                                                                                  ^ meta.block.for.ruby variable.other.ruby
#                                                                                   ^ meta.block.for.ruby
#                                                                                    ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                                                                      ^ meta.block.for.ruby
#                                                                                       ^ meta.block.for.ruby variable.other.ruby
#                                                                                        ^ meta.block.for.ruby
#                                                                                         ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                                                                           ^ meta.block.for.ruby
#                                                                                            ^ meta.block.for.ruby constant.numeric.ruby
#                                                                                             ^ meta.block.for.ruby
#                                                                                              ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                                                                  ^ punctuation.section.scope.end.ruby
  {:foo => for i in [1,2,3] do break i if i == 2 end}
# ^ punctuation.section.scope.begin.ruby
#  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#   ^^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#          ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby
#              ^ meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby
#                ^^ meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby
#                   ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                    ^ meta.block.for.ruby constant.numeric.ruby
#                     ^ meta.block.for.ruby punctuation.separator.object.ruby
#                      ^ meta.block.for.ruby constant.numeric.ruby
#                       ^ meta.block.for.ruby punctuation.separator.object.ruby
#                        ^ meta.block.for.ruby constant.numeric.ruby
#                         ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                          ^ meta.block.for.ruby
#                           ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                             ^ meta.block.for.ruby
#                              ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                   ^ meta.block.for.ruby
#                                    ^ meta.block.for.ruby variable.other.ruby
#                                     ^ meta.block.for.ruby
#                                      ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                        ^ meta.block.for.ruby
#                                         ^ meta.block.for.ruby variable.other.ruby
#                                          ^ meta.block.for.ruby
#                                           ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                             ^ meta.block.for.ruby
#                                              ^ meta.block.for.ruby constant.numeric.ruby
#                                               ^ meta.block.for.ruby
#                                                ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                   ^ punctuation.section.scope.end.ruby
  { :foo => for i in [1,2,3] do break i if i == 2 end, :bar=>for i in [1,2,3] do break i if i == 3 end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#           ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#              ^ meta.block.for.ruby
#               ^ meta.block.for.ruby variable.other.ruby
#                ^ meta.block.for.ruby
#                 ^^ meta.block.for.ruby keyword.control.in.ruby
#                   ^ meta.block.for.ruby
#                    ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                     ^ meta.block.for.ruby constant.numeric.ruby
#                      ^ meta.block.for.ruby punctuation.separator.object.ruby
#                       ^ meta.block.for.ruby constant.numeric.ruby
#                        ^ meta.block.for.ruby punctuation.separator.object.ruby
#                         ^ meta.block.for.ruby constant.numeric.ruby
#                          ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                           ^ meta.block.for.ruby
#                            ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                              ^ meta.block.for.ruby
#                               ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                    ^ meta.block.for.ruby
#                                     ^ meta.block.for.ruby variable.other.ruby
#                                      ^ meta.block.for.ruby
#                                       ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                         ^ meta.block.for.ruby
#                                          ^ meta.block.for.ruby variable.other.ruby
#                                           ^ meta.block.for.ruby
#                                            ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                              ^ meta.block.for.ruby
#                                               ^ meta.block.for.ruby constant.numeric.ruby
#                                                ^ meta.block.for.ruby
#                                                 ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                    ^ punctuation.separator.object.ruby
#                                                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#                                                       ^^^ constant.language.symbol.hashkey.ruby
#                                                          ^^ punctuation.separator.key-value
#                                                            ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#                                                               ^ meta.block.for.ruby
#                                                                ^ meta.block.for.ruby variable.other.ruby
#                                                                 ^ meta.block.for.ruby
#                                                                  ^^ meta.block.for.ruby keyword.control.in.ruby
#                                                                    ^ meta.block.for.ruby
#                                                                     ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#                                                                      ^ meta.block.for.ruby constant.numeric.ruby
#                                                                       ^ meta.block.for.ruby punctuation.separator.object.ruby
#                                                                        ^ meta.block.for.ruby constant.numeric.ruby
#                                                                         ^ meta.block.for.ruby punctuation.separator.object.ruby
#                                                                          ^ meta.block.for.ruby constant.numeric.ruby
#                                                                           ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                                                                            ^ meta.block.for.ruby
#                                                                             ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                                                                               ^ meta.block.for.ruby
#                                                                                ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                                                                     ^ meta.block.for.ruby
#                                                                                      ^ meta.block.for.ruby variable.other.ruby
#                                                                                       ^ meta.block.for.ruby
#                                                                                        ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                                                                          ^ meta.block.for.ruby
#                                                                                           ^ meta.block.for.ruby variable.other.ruby
#                                                                                            ^ meta.block.for.ruby
#                                                                                             ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                                                                               ^ meta.block.for.ruby
#                                                                                                ^ meta.block.for.ruby constant.numeric.ruby
#                                                                                                 ^ meta.block.for.ruby
#                                                                                                  ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                                                                                      ^ punctuation.section.scope.end.ruby
  (for i in [1,2,3] do break i if i == 2 end)
# ^ punctuation.section.function.ruby
#  ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#     ^ meta.block.for.ruby
#      ^ meta.block.for.ruby variable.other.ruby
#       ^ meta.block.for.ruby
#        ^^ meta.block.for.ruby keyword.control.in.ruby
#          ^ meta.block.for.ruby
#           ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#            ^ meta.block.for.ruby constant.numeric.ruby
#             ^ meta.block.for.ruby punctuation.separator.object.ruby
#              ^ meta.block.for.ruby constant.numeric.ruby
#               ^ meta.block.for.ruby punctuation.separator.object.ruby
#                ^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                  ^ meta.block.for.ruby
#                   ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                     ^ meta.block.for.ruby
#                      ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                           ^ meta.block.for.ruby
#                            ^ meta.block.for.ruby variable.other.ruby
#                             ^ meta.block.for.ruby
#                              ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                ^ meta.block.for.ruby
#                                 ^ meta.block.for.ruby variable.other.ruby
#                                  ^ meta.block.for.ruby
#                                   ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                     ^ meta.block.for.ruby
#                                      ^ meta.block.for.ruby constant.numeric.ruby
#                                       ^ meta.block.for.ruby
#                                        ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                           ^ punctuation.section.function.ruby
  ( for i in [1,2,3] do break i if i == 2 end )
# ^ punctuation.section.function.ruby
#   ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#      ^ meta.block.for.ruby
#       ^ meta.block.for.ruby variable.other.ruby
#        ^ meta.block.for.ruby
#         ^^ meta.block.for.ruby keyword.control.in.ruby
#           ^ meta.block.for.ruby
#            ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#             ^ meta.block.for.ruby constant.numeric.ruby
#              ^ meta.block.for.ruby punctuation.separator.object.ruby
#               ^ meta.block.for.ruby constant.numeric.ruby
#                ^ meta.block.for.ruby punctuation.separator.object.ruby
#                 ^ meta.block.for.ruby constant.numeric.ruby
#                  ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                   ^ meta.block.for.ruby
#                    ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                      ^ meta.block.for.ruby
#                       ^^^^^ meta.block.for.ruby keyword.control.pseudo-method.ruby
#                            ^ meta.block.for.ruby
#                             ^ meta.block.for.ruby variable.other.ruby
#                              ^ meta.block.for.ruby
#                               ^^ meta.block.for.ruby keyword.control.modifier.conditional.if.ruby
#                                 ^ meta.block.for.ruby
#                                  ^ meta.block.for.ruby variable.other.ruby
#                                   ^ meta.block.for.ruby
#                                    ^^ meta.block.for.ruby keyword.operator.comparison.ruby
#                                      ^ meta.block.for.ruby
#                                       ^ meta.block.for.ruby constant.numeric.ruby
#                                        ^ meta.block.for.ruby
#                                         ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                             ^ punctuation.section.function.ruby

  #you cant use do-end blocks inside in statement
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  for i in 3.times.map do 1 end do puts i; end                     # shouldn't work
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby constant.numeric.ruby
#           ^ meta.block.for.ruby punctuation.separator.method.ruby
#            ^^^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                 ^ meta.block.for.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#                     ^ meta.block.for.ruby
#                      ^^ meta.block.for.ruby keyword.control.optional.do.ruby
#                        ^ meta.block.for.ruby
#                         ^ meta.block.for.ruby constant.numeric.ruby
#                          ^ meta.block.for.ruby
#                           ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                               ^^ meta.block.do.ruby keyword.control.do.begin.ruby
#                                 ^ meta.block.do.ruby
#                                  ^^^^ meta.block.do.ruby support.function.kernel.ruby
#                                      ^ meta.block.do.ruby
#                                       ^ meta.block.do.ruby variable.other.ruby
#                                        ^ meta.block.do.ruby punctuation.separator.statement.ruby
#                                         ^ meta.block.do.ruby
#                                          ^^^ meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                                                  ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                   ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  for? i in [1,2,3]                                                # shouldn't work
# ^^^ variable.other.ruby
#      ^ variable.other.ruby
#        ^^ variable.other.ruby
#           ^ punctuation.section.array.begin.ruby
#            ^ constant.numeric.ruby
#             ^ punctuation.separator.object.ruby
#              ^ constant.numeric.ruby
#               ^ punctuation.separator.object.ruby
#                ^ constant.numeric.ruby
#                 ^ punctuation.section.array.end.ruby
#                                                                  ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                   ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  for! i in [1,2,3]                                                # shouldn't work
# ^^^ variable.other.ruby
#      ^ variable.other.ruby
#        ^^ variable.other.ruby
#           ^ punctuation.section.array.begin.ruby
#            ^ constant.numeric.ruby
#             ^ punctuation.separator.object.ruby
#              ^ constant.numeric.ruby
#               ^ punctuation.separator.object.ruby
#                ^ constant.numeric.ruby
#                 ^ punctuation.section.array.end.ruby
#                                                                  ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                   ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  self.for i in [1,2,3]                                            # shouldn't work
# ^^^^ variable.language.self.ruby
#     ^ punctuation.separator.method.ruby
#      ^^^ meta.function-call.ruby entity.name.function.ruby
#          ^ variable.other.ruby
#            ^^ variable.other.ruby
#               ^ punctuation.section.array.begin.ruby
#                ^ constant.numeric.ruby
#                 ^ punctuation.separator.object.ruby
#                  ^ constant.numeric.ruby
#                   ^ punctuation.separator.object.ruby
#                    ^ constant.numeric.ruby
#                     ^ punctuation.section.array.end.ruby
#                                                                  ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                   ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby

  # multiline
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^ comment.line.number-sign.ruby
  for i in [1,2,3]
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#           ^ meta.block.for.ruby constant.numeric.ruby
#            ^ meta.block.for.ruby punctuation.separator.object.ruby
#             ^ meta.block.for.ruby constant.numeric.ruby
#              ^ meta.block.for.ruby punctuation.separator.object.ruby
#               ^ meta.block.for.ruby constant.numeric.ruby
#                ^ meta.block.for.ruby punctuation.section.array.end.ruby
    puts i
#^^^ meta.block.for.ruby
#   ^^^^ meta.block.for.ruby support.function.kernel.ruby
#       ^ meta.block.for.ruby
#        ^ meta.block.for.ruby variable.other.ruby
  end
#^ meta.block.for.ruby
# ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby

  for i in [(0..10), (10..20)] do
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#           ^ meta.block.for.ruby punctuation.section.function.ruby
#            ^ meta.block.for.ruby constant.numeric.ruby
#             ^ meta.block.for.ruby punctuation.separator.method.ruby
#              ^ meta.block.for.ruby punctuation.separator.method.ruby
#               ^^ meta.block.for.ruby constant.numeric.ruby
#                 ^ meta.block.for.ruby punctuation.section.function.ruby
#                  ^ meta.block.for.ruby punctuation.separator.object.ruby
#                   ^ meta.block.for.ruby
#                    ^ meta.block.for.ruby punctuation.section.function.ruby
#                     ^^ meta.block.for.ruby constant.numeric.ruby
#                       ^ meta.block.for.ruby punctuation.separator.method.ruby
#                        ^ meta.block.for.ruby punctuation.separator.method.ruby
#                         ^^ meta.block.for.ruby constant.numeric.ruby
#                           ^ meta.block.for.ruby punctuation.section.function.ruby
#                            ^ meta.block.for.ruby punctuation.section.array.end.ruby
#                             ^ meta.block.for.ruby
#                              ^^ meta.block.for.ruby keyword.control.optional.do.ruby
    puts i.end
#^^^ meta.block.for.ruby
#   ^^^^ meta.block.for.ruby support.function.kernel.ruby
#       ^ meta.block.for.ruby
#        ^ meta.block.for.ruby variable.other.ruby
#         ^ meta.block.for.ruby punctuation.separator.method.ruby
#          ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.block.for.ruby
# ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby

  for i in []
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#           ^ meta.block.for.ruby punctuation.section.array.end.ruby
    puts end?
#^^^ meta.block.for.ruby
#   ^^^^ meta.block.for.ruby support.function.kernel.ruby
#       ^ meta.block.for.ruby
#        ^^^ meta.block.for.ruby variable.other.ruby
#           ^^ meta.block.for.ruby
    puts end!
#^^^ meta.block.for.ruby
#   ^^^^ meta.block.for.ruby support.function.kernel.ruby
#       ^ meta.block.for.ruby
#        ^^^ meta.block.for.ruby variable.other.ruby
#           ^^ meta.block.for.ruby
  end
#^ meta.block.for.ruby
# ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby

  for i in for j in [[1,2]] do break j; end do
# ^^^ meta.block.for.ruby keyword.control.for.begin.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
#      ^ meta.block.for.ruby
#       ^^ meta.block.for.ruby keyword.control.in.ruby
#         ^ meta.block.for.ruby
#          ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.for.begin.ruby
#             ^ meta.block.for.ruby meta.block.for.ruby
#              ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#               ^ meta.block.for.ruby meta.block.for.ruby
#                ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.in.ruby
#                  ^ meta.block.for.ruby meta.block.for.ruby
#                   ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                    ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.begin.ruby
#                     ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                      ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.object.ruby
#                       ^ meta.block.for.ruby meta.block.for.ruby constant.numeric.ruby
#                        ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                         ^ meta.block.for.ruby meta.block.for.ruby punctuation.section.array.end.ruby
#                          ^ meta.block.for.ruby meta.block.for.ruby
#                           ^^ meta.block.for.ruby meta.block.for.ruby keyword.control.optional.do.ruby
#                             ^ meta.block.for.ruby meta.block.for.ruby
#                              ^^^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.pseudo-method.ruby
#                                   ^ meta.block.for.ruby meta.block.for.ruby
#                                    ^ meta.block.for.ruby meta.block.for.ruby variable.other.ruby
#                                     ^ meta.block.for.ruby meta.block.for.ruby punctuation.separator.statement.ruby
#                                      ^ meta.block.for.ruby meta.block.for.ruby
#                                       ^^^ meta.block.for.ruby meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby
#                                          ^ meta.block.for.ruby
#                                           ^^ meta.block.for.ruby keyword.control.optional.do.ruby
    r = [i].map do |e|
#^^^ meta.block.for.ruby
#   ^ meta.block.for.ruby variable.other.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby keyword.operator.assignment.ruby
#      ^ meta.block.for.ruby
#       ^ meta.block.for.ruby punctuation.section.array.begin.ruby
#        ^ meta.block.for.ruby variable.other.ruby
#         ^ meta.block.for.ruby punctuation.section.array.end.ruby
#          ^ meta.block.for.ruby punctuation.separator.method.ruby
#           ^^^ meta.block.for.ruby meta.function-call.ruby entity.name.function.ruby
#              ^ meta.block.for.ruby
#               ^^ meta.block.for.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                 ^ meta.block.for.ruby meta.block.do.ruby
#                  ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                   ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                    ^ meta.block.for.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
      e
#^^^^^ meta.block.for.ruby meta.block.do.ruby
#     ^ meta.block.for.ruby meta.block.do.ruby variable.other.ruby
    end
#^^^ meta.block.for.ruby meta.block.do.ruby
#   ^^^ meta.block.for.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
    p r
#^^^ meta.block.for.ruby
#   ^ meta.block.for.ruby support.function.kernel.ruby
#    ^ meta.block.for.ruby
#     ^ meta.block.for.ruby variable.other.ruby
  end
#^ meta.block.for.ruby
# ^^^ meta.block.for.ruby keyword.control.end.ruby keyword.control.for.end.ruby

  i = 0
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^ constant.numeric.ruby
  while i < 10; i += 1; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby
#           ^^ meta.block.while.ruby constant.numeric.ruby
#             ^ meta.block.while.ruby punctuation.separator.statement.ruby
#              ^ meta.block.while.ruby
#               ^ meta.block.while.ruby variable.other.ruby
#                ^ meta.block.while.ruby
#                 ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                   ^ meta.block.while.ruby
#                    ^ meta.block.while.ruby constant.numeric.ruby
#                     ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                      ^ meta.block.while.ruby
#                       ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while i < 10 do i += 1; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby
#           ^^ meta.block.while.ruby constant.numeric.ruby
#             ^ meta.block.while.ruby
#              ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                ^ meta.block.while.ruby
#                 ^ meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby
#                   ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                     ^ meta.block.while.ruby
#                      ^ meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                        ^ meta.block.while.ruby
#                         ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  a = while i < 10 do break i if i == 5; i += 1; end
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#    ^ meta.block.while.ruby
#     ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#          ^ meta.block.while.ruby
#           ^ meta.block.while.ruby variable.other.ruby
#            ^ meta.block.while.ruby
#             ^ meta.block.while.ruby keyword.operator.comparison.ruby
#              ^ meta.block.while.ruby
#               ^^ meta.block.while.ruby constant.numeric.ruby
#                 ^ meta.block.while.ruby
#                  ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                    ^ meta.block.while.ruby
#                     ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                          ^ meta.block.while.ruby
#                           ^ meta.block.while.ruby variable.other.ruby
#                            ^ meta.block.while.ruby
#                             ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                               ^ meta.block.while.ruby
#                                ^ meta.block.while.ruby variable.other.ruby
#                                 ^ meta.block.while.ruby
#                                  ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby constant.numeric.ruby
#                                      ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                       ^ meta.block.while.ruby
#                                        ^ meta.block.while.ruby variable.other.ruby
#                                         ^ meta.block.while.ruby
#                                          ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                            ^ meta.block.while.ruby
#                                             ^ meta.block.while.ruby constant.numeric.ruby
#                                              ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                               ^ meta.block.while.ruby
#                                                ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  false || while i < 10 do break i if i == 5; i += 1; end
# ^^^^^ constant.language.boolean.ruby
#       ^^ keyword.operator.logical.ruby
#         ^ meta.block.while.ruby
#          ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby variable.other.ruby
#                 ^ meta.block.while.ruby
#                  ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby constant.numeric.ruby
#                      ^ meta.block.while.ruby
#                       ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                         ^ meta.block.while.ruby
#                          ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                               ^ meta.block.while.ruby
#                                ^ meta.block.while.ruby variable.other.ruby
#                                 ^ meta.block.while.ruby
#                                  ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby variable.other.ruby
#                                      ^ meta.block.while.ruby
#                                       ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                           ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                            ^ meta.block.while.ruby
#                                             ^ meta.block.while.ruby variable.other.ruby
#                                              ^ meta.block.while.ruby
#                                               ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                 ^ meta.block.while.ruby
#                                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                    ^ meta.block.while.ruby
#                                                     ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  false or while i < 10; break i if i == 5; i += 1; end
# ^^^^^ constant.language.boolean.ruby
#       ^^ keyword.operator.logical.ruby
#         ^ meta.block.while.ruby
#          ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby variable.other.ruby
#                 ^ meta.block.while.ruby
#                  ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby constant.numeric.ruby
#                      ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                       ^ meta.block.while.ruby
#                        ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                             ^ meta.block.while.ruby
#                              ^ meta.block.while.ruby variable.other.ruby
#                               ^ meta.block.while.ruby
#                                ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby variable.other.ruby
#                                    ^ meta.block.while.ruby
#                                     ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                       ^ meta.block.while.ruby
#                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby variable.other.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                               ^ meta.block.while.ruby
#                                                ^ meta.block.while.ruby constant.numeric.ruby
#                                                 ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                  ^ meta.block.while.ruby
#                                                   ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  true && while i < 10; break i if i == 5; i += 1; end
# ^^^^ constant.language.boolean.ruby
#      ^^ keyword.operator.logical.ruby
#        ^ meta.block.while.ruby
#         ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#              ^ meta.block.while.ruby
#               ^ meta.block.while.ruby variable.other.ruby
#                ^ meta.block.while.ruby
#                 ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                  ^ meta.block.while.ruby
#                   ^^ meta.block.while.ruby constant.numeric.ruby
#                     ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                      ^ meta.block.while.ruby
#                       ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                            ^ meta.block.while.ruby
#                             ^ meta.block.while.ruby variable.other.ruby
#                              ^ meta.block.while.ruby
#                               ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                 ^ meta.block.while.ruby
#                                  ^ meta.block.while.ruby variable.other.ruby
#                                   ^ meta.block.while.ruby
#                                    ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                      ^ meta.block.while.ruby
#                                       ^ meta.block.while.ruby constant.numeric.ruby
#                                        ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby variable.other.ruby
#                                           ^ meta.block.while.ruby
#                                            ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                              ^ meta.block.while.ruby
#                                               ^ meta.block.while.ruby constant.numeric.ruby
#                                                ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                 ^ meta.block.while.ruby
#                                                  ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  true and while i < 10 do break i if i == 5; i += 1; end
# ^^^^ constant.language.boolean.ruby
#      ^^^ keyword.operator.logical.ruby
#         ^ meta.block.while.ruby
#          ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby variable.other.ruby
#                 ^ meta.block.while.ruby
#                  ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby constant.numeric.ruby
#                      ^ meta.block.while.ruby
#                       ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                         ^ meta.block.while.ruby
#                          ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                               ^ meta.block.while.ruby
#                                ^ meta.block.while.ruby variable.other.ruby
#                                 ^ meta.block.while.ruby
#                                  ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby variable.other.ruby
#                                      ^ meta.block.while.ruby
#                                       ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                           ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                            ^ meta.block.while.ruby
#                                             ^ meta.block.while.ruby variable.other.ruby
#                                              ^ meta.block.while.ruby
#                                               ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                 ^ meta.block.while.ruby
#                                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                    ^ meta.block.while.ruby
#                                                     ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  1..while i < 10 do break i if i == 5; i += 1; end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#         ^ meta.block.while.ruby
#          ^ meta.block.while.ruby variable.other.ruby
#           ^ meta.block.while.ruby
#            ^ meta.block.while.ruby keyword.operator.comparison.ruby
#             ^ meta.block.while.ruby
#              ^^ meta.block.while.ruby constant.numeric.ruby
#                ^ meta.block.while.ruby
#                 ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                   ^ meta.block.while.ruby
#                    ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                         ^ meta.block.while.ruby
#                          ^ meta.block.while.ruby variable.other.ruby
#                           ^ meta.block.while.ruby
#                            ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                              ^ meta.block.while.ruby
#                               ^ meta.block.while.ruby variable.other.ruby
#                                ^ meta.block.while.ruby
#                                 ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                   ^ meta.block.while.ruby
#                                    ^ meta.block.while.ruby constant.numeric.ruby
#                                     ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                      ^ meta.block.while.ruby
#                                       ^ meta.block.while.ruby variable.other.ruby
#                                        ^ meta.block.while.ruby
#                                         ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                           ^ meta.block.while.ruby
#                                            ^ meta.block.while.ruby constant.numeric.ruby
#                                             ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                              ^ meta.block.while.ruby
#                                               ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  1...while i < 10 do break i if i == 5; i += 1; end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#          ^ meta.block.while.ruby
#           ^ meta.block.while.ruby variable.other.ruby
#            ^ meta.block.while.ruby
#             ^ meta.block.while.ruby keyword.operator.comparison.ruby
#              ^ meta.block.while.ruby
#               ^^ meta.block.while.ruby constant.numeric.ruby
#                 ^ meta.block.while.ruby
#                  ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                    ^ meta.block.while.ruby
#                     ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                          ^ meta.block.while.ruby
#                           ^ meta.block.while.ruby variable.other.ruby
#                            ^ meta.block.while.ruby
#                             ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                               ^ meta.block.while.ruby
#                                ^ meta.block.while.ruby variable.other.ruby
#                                 ^ meta.block.while.ruby
#                                  ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby constant.numeric.ruby
#                                      ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                       ^ meta.block.while.ruby
#                                        ^ meta.block.while.ruby variable.other.ruby
#                                         ^ meta.block.while.ruby
#                                          ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                            ^ meta.block.while.ruby
#                                             ^ meta.block.while.ruby constant.numeric.ruby
#                                              ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                               ^ meta.block.while.ruby
#                                                ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  true ? while i < 10; break i if i == 5; i += 1; end : while i < 10; break i if i == 5; i += 1; end
# ^^^^ constant.language.boolean.ruby
#      ^ keyword.operator.comparison.ruby
#       ^ meta.block.while.ruby
#        ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#             ^ meta.block.while.ruby
#              ^ meta.block.while.ruby variable.other.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                 ^ meta.block.while.ruby
#                  ^^ meta.block.while.ruby constant.numeric.ruby
#                    ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                     ^ meta.block.while.ruby
#                      ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                           ^ meta.block.while.ruby
#                            ^ meta.block.while.ruby variable.other.ruby
#                             ^ meta.block.while.ruby
#                              ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                ^ meta.block.while.ruby
#                                 ^ meta.block.while.ruby variable.other.ruby
#                                  ^ meta.block.while.ruby
#                                   ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                     ^ meta.block.while.ruby
#                                      ^ meta.block.while.ruby constant.numeric.ruby
#                                       ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                        ^ meta.block.while.ruby
#                                         ^ meta.block.while.ruby variable.other.ruby
#                                          ^ meta.block.while.ruby
#                                           ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                             ^ meta.block.while.ruby
#                                              ^ meta.block.while.ruby constant.numeric.ruby
#                                               ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                ^ meta.block.while.ruby
#                                                 ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                     ^ punctuation.separator.other.ruby
#                                                      ^ meta.block.while.ruby
#                                                       ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#                                                            ^ meta.block.while.ruby
#                                                             ^ meta.block.while.ruby variable.other.ruby
#                                                              ^ meta.block.while.ruby
#                                                               ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                ^ meta.block.while.ruby
#                                                                 ^^ meta.block.while.ruby constant.numeric.ruby
#                                                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                    ^ meta.block.while.ruby
#                                                                     ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                                          ^ meta.block.while.ruby
#                                                                           ^ meta.block.while.ruby variable.other.ruby
#                                                                            ^ meta.block.while.ruby
#                                                                             ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                               ^ meta.block.while.ruby
#                                                                                ^ meta.block.while.ruby variable.other.ruby
#                                                                                 ^ meta.block.while.ruby
#                                                                                  ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                                    ^ meta.block.while.ruby
#                                                                                     ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                      ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                       ^ meta.block.while.ruby
#                                                                                        ^ meta.block.while.ruby variable.other.ruby
#                                                                                         ^ meta.block.while.ruby
#                                                                                          ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                                            ^ meta.block.while.ruby
#                                                                                             ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                              ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                               ^ meta.block.while.ruby
#                                                                                                ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  !while i < 10; break i if i == 5; i += 1; end
# ^ keyword.operator.logical.ruby
#  ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby variable.other.ruby
#         ^ meta.block.while.ruby
#          ^ meta.block.while.ruby keyword.operator.comparison.ruby
#           ^ meta.block.while.ruby
#            ^^ meta.block.while.ruby constant.numeric.ruby
#              ^ meta.block.while.ruby punctuation.separator.statement.ruby
#               ^ meta.block.while.ruby
#                ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                     ^ meta.block.while.ruby
#                      ^ meta.block.while.ruby variable.other.ruby
#                       ^ meta.block.while.ruby
#                        ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                          ^ meta.block.while.ruby
#                           ^ meta.block.while.ruby variable.other.ruby
#                            ^ meta.block.while.ruby
#                             ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                               ^ meta.block.while.ruby
#                                ^ meta.block.while.ruby constant.numeric.ruby
#                                 ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby variable.other.ruby
#                                    ^ meta.block.while.ruby
#                                     ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                       ^ meta.block.while.ruby
#                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                          ^ meta.block.while.ruby
#                                           ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  ! while i < 10; break i if i == 5; i += 1; end
# ^ keyword.operator.logical.ruby
#  ^ meta.block.while.ruby
#   ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby variable.other.ruby
#          ^ meta.block.while.ruby
#           ^ meta.block.while.ruby keyword.operator.comparison.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby constant.numeric.ruby
#               ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                ^ meta.block.while.ruby
#                 ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                      ^ meta.block.while.ruby
#                       ^ meta.block.while.ruby variable.other.ruby
#                        ^ meta.block.while.ruby
#                         ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                           ^ meta.block.while.ruby
#                            ^ meta.block.while.ruby variable.other.ruby
#                             ^ meta.block.while.ruby
#                              ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                ^ meta.block.while.ruby
#                                 ^ meta.block.while.ruby constant.numeric.ruby
#                                  ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                   ^ meta.block.while.ruby
#                                    ^ meta.block.while.ruby variable.other.ruby
#                                     ^ meta.block.while.ruby
#                                      ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                        ^ meta.block.while.ruby
#                                         ^ meta.block.while.ruby constant.numeric.ruby
#                                          ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                           ^ meta.block.while.ruby
#                                            ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  true && !while i < 10; break i if i == 5; i += 1; end
# ^^^^ constant.language.boolean.ruby
#      ^^ keyword.operator.logical.ruby
#         ^ keyword.operator.logical.ruby
#          ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby variable.other.ruby
#                 ^ meta.block.while.ruby
#                  ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby constant.numeric.ruby
#                      ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                       ^ meta.block.while.ruby
#                        ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                             ^ meta.block.while.ruby
#                              ^ meta.block.while.ruby variable.other.ruby
#                               ^ meta.block.while.ruby
#                                ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby variable.other.ruby
#                                    ^ meta.block.while.ruby
#                                     ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                       ^ meta.block.while.ruby
#                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby variable.other.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                               ^ meta.block.while.ruby
#                                                ^ meta.block.while.ruby constant.numeric.ruby
#                                                 ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                  ^ meta.block.while.ruby
#                                                   ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  true && ! while i < 10; break i if i == 5; i += 1; end
# ^^^^ constant.language.boolean.ruby
#      ^^ keyword.operator.logical.ruby
#         ^ keyword.operator.logical.ruby
#          ^ meta.block.while.ruby
#           ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#                ^ meta.block.while.ruby
#                 ^ meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby
#                   ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                    ^ meta.block.while.ruby
#                     ^^ meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                        ^ meta.block.while.ruby
#                         ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                              ^ meta.block.while.ruby
#                               ^ meta.block.while.ruby variable.other.ruby
#                                ^ meta.block.while.ruby
#                                 ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                   ^ meta.block.while.ruby
#                                    ^ meta.block.while.ruby variable.other.ruby
#                                     ^ meta.block.while.ruby
#                                      ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                        ^ meta.block.while.ruby
#                                         ^ meta.block.while.ruby constant.numeric.ruby
#                                          ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                           ^ meta.block.while.ruby
#                                            ^ meta.block.while.ruby variable.other.ruby
#                                             ^ meta.block.while.ruby
#                                              ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                ^ meta.block.while.ruby
#                                                 ^ meta.block.while.ruby constant.numeric.ruby
#                                                  ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                   ^ meta.block.while.ruby
#                                                    ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while i < while j < 10; break j if j == 5; j+=1; end; break i if i > 3; i += 1; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby meta.block.while.ruby
#           ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.while.begin.ruby
#                ^ meta.block.while.ruby meta.block.while.ruby
#                 ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby meta.block.while.ruby
#                   ^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                    ^ meta.block.while.ruby meta.block.while.ruby
#                     ^^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                        ^ meta.block.while.ruby meta.block.while.ruby
#                         ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.pseudo-method.ruby
#                              ^ meta.block.while.ruby meta.block.while.ruby
#                               ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                ^ meta.block.while.ruby meta.block.while.ruby
#                                 ^^ meta.block.while.ruby meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                   ^ meta.block.while.ruby meta.block.while.ruby
#                                    ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                     ^ meta.block.while.ruby meta.block.while.ruby
#                                      ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                                        ^ meta.block.while.ruby meta.block.while.ruby
#                                         ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                          ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                           ^ meta.block.while.ruby meta.block.while.ruby
#                                            ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                             ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                               ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                                ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                                 ^ meta.block.while.ruby meta.block.while.ruby
#                                                  ^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                     ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                      ^ meta.block.while.ruby
#                                                       ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                            ^ meta.block.while.ruby
#                                                             ^ meta.block.while.ruby variable.other.ruby
#                                                              ^ meta.block.while.ruby
#                                                               ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                 ^ meta.block.while.ruby
#                                                                  ^ meta.block.while.ruby variable.other.ruby
#                                                                   ^ meta.block.while.ruby
#                                                                    ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                     ^ meta.block.while.ruby
#                                                                      ^ meta.block.while.ruby constant.numeric.ruby
#                                                                       ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                        ^ meta.block.while.ruby
#                                                                         ^ meta.block.while.ruby variable.other.ruby
#                                                                          ^ meta.block.while.ruby
#                                                                           ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                             ^ meta.block.while.ruby
#                                                                              ^ meta.block.while.ruby constant.numeric.ruby
#                                                                               ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                ^ meta.block.while.ruby
#                                                                                 ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while i < while j < 10 do break j if j == 5; j+=1; end; break i if i > 3; i += 1; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby meta.block.while.ruby
#           ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.while.begin.ruby
#                ^ meta.block.while.ruby meta.block.while.ruby
#                 ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby meta.block.while.ruby
#                   ^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                    ^ meta.block.while.ruby meta.block.while.ruby
#                     ^^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby meta.block.while.ruby
#                        ^^ meta.block.while.ruby meta.block.while.ruby keyword.control.optional.do.ruby
#                          ^ meta.block.while.ruby meta.block.while.ruby
#                           ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                ^ meta.block.while.ruby meta.block.while.ruby
#                                 ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                  ^ meta.block.while.ruby meta.block.while.ruby
#                                   ^^ meta.block.while.ruby meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                     ^ meta.block.while.ruby meta.block.while.ruby
#                                      ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                       ^ meta.block.while.ruby meta.block.while.ruby
#                                        ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                                          ^ meta.block.while.ruby meta.block.while.ruby
#                                           ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                            ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                             ^ meta.block.while.ruby meta.block.while.ruby
#                                              ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                               ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                 ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                                  ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                                   ^ meta.block.while.ruby meta.block.while.ruby
#                                                    ^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                       ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                        ^ meta.block.while.ruby
#                                                         ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                              ^ meta.block.while.ruby
#                                                               ^ meta.block.while.ruby variable.other.ruby
#                                                                ^ meta.block.while.ruby
#                                                                 ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                   ^ meta.block.while.ruby
#                                                                    ^ meta.block.while.ruby variable.other.ruby
#                                                                     ^ meta.block.while.ruby
#                                                                      ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                       ^ meta.block.while.ruby
#                                                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                                                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                          ^ meta.block.while.ruby
#                                                                           ^ meta.block.while.ruby variable.other.ruby
#                                                                            ^ meta.block.while.ruby
#                                                                             ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                               ^ meta.block.while.ruby
#                                                                                ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                 ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                  ^ meta.block.while.ruby
#                                                                                   ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while i < while j < 10; break j if j == 5; j+=1; end do break i if i > 3; i += 1; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby meta.block.while.ruby
#           ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.while.begin.ruby
#                ^ meta.block.while.ruby meta.block.while.ruby
#                 ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby meta.block.while.ruby
#                   ^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                    ^ meta.block.while.ruby meta.block.while.ruby
#                     ^^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                        ^ meta.block.while.ruby meta.block.while.ruby
#                         ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.pseudo-method.ruby
#                              ^ meta.block.while.ruby meta.block.while.ruby
#                               ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                ^ meta.block.while.ruby meta.block.while.ruby
#                                 ^^ meta.block.while.ruby meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                   ^ meta.block.while.ruby meta.block.while.ruby
#                                    ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                     ^ meta.block.while.ruby meta.block.while.ruby
#                                      ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                                        ^ meta.block.while.ruby meta.block.while.ruby
#                                         ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                          ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                           ^ meta.block.while.ruby meta.block.while.ruby
#                                            ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                             ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                               ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                                ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                                 ^ meta.block.while.ruby meta.block.while.ruby
#                                                  ^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                     ^ meta.block.while.ruby
#                                                      ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                                                        ^ meta.block.while.ruby
#                                                         ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                              ^ meta.block.while.ruby
#                                                               ^ meta.block.while.ruby variable.other.ruby
#                                                                ^ meta.block.while.ruby
#                                                                 ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                   ^ meta.block.while.ruby
#                                                                    ^ meta.block.while.ruby variable.other.ruby
#                                                                     ^ meta.block.while.ruby
#                                                                      ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                       ^ meta.block.while.ruby
#                                                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                                                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                          ^ meta.block.while.ruby
#                                                                           ^ meta.block.while.ruby variable.other.ruby
#                                                                            ^ meta.block.while.ruby
#                                                                             ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                               ^ meta.block.while.ruby
#                                                                                ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                 ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                  ^ meta.block.while.ruby
#                                                                                   ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while i < while j < 10 do break j if j == 5; j+=1; end do break i if i > 3; i += 1; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby meta.block.while.ruby
#           ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.while.begin.ruby
#                ^ meta.block.while.ruby meta.block.while.ruby
#                 ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby meta.block.while.ruby
#                   ^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                    ^ meta.block.while.ruby meta.block.while.ruby
#                     ^^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby meta.block.while.ruby
#                        ^^ meta.block.while.ruby meta.block.while.ruby keyword.control.optional.do.ruby
#                          ^ meta.block.while.ruby meta.block.while.ruby
#                           ^^^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                ^ meta.block.while.ruby meta.block.while.ruby
#                                 ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                  ^ meta.block.while.ruby meta.block.while.ruby
#                                   ^^ meta.block.while.ruby meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                     ^ meta.block.while.ruby meta.block.while.ruby
#                                      ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                       ^ meta.block.while.ruby meta.block.while.ruby
#                                        ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                                          ^ meta.block.while.ruby meta.block.while.ruby
#                                           ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                            ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                             ^ meta.block.while.ruby meta.block.while.ruby
#                                              ^ meta.block.while.ruby meta.block.while.ruby variable.other.ruby
#                                               ^^ meta.block.while.ruby meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                 ^ meta.block.while.ruby meta.block.while.ruby constant.numeric.ruby
#                                                  ^ meta.block.while.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                                   ^ meta.block.while.ruby meta.block.while.ruby
#                                                    ^^^ meta.block.while.ruby meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                       ^ meta.block.while.ruby
#                                                        ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                                                          ^ meta.block.while.ruby
#                                                           ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                                ^ meta.block.while.ruby
#                                                                 ^ meta.block.while.ruby variable.other.ruby
#                                                                  ^ meta.block.while.ruby
#                                                                   ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                     ^ meta.block.while.ruby
#                                                                      ^ meta.block.while.ruby variable.other.ruby
#                                                                       ^ meta.block.while.ruby
#                                                                        ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                         ^ meta.block.while.ruby
#                                                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                                                           ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                            ^ meta.block.while.ruby
#                                                                             ^ meta.block.while.ruby variable.other.ruby
#                                                                              ^ meta.block.while.ruby
#                                                                               ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                                 ^ meta.block.while.ruby
#                                                                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                    ^ meta.block.while.ruby
#                                                                                     ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while false do [1,2,3].each do |e| puts e end; end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^^^^^ meta.block.while.ruby constant.language.boolean.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby punctuation.section.array.begin.ruby
#                 ^ meta.block.while.ruby constant.numeric.ruby
#                  ^ meta.block.while.ruby punctuation.separator.object.ruby
#                   ^ meta.block.while.ruby constant.numeric.ruby
#                    ^ meta.block.while.ruby punctuation.separator.object.ruby
#                     ^ meta.block.while.ruby constant.numeric.ruby
#                      ^ meta.block.while.ruby punctuation.section.array.end.ruby
#                       ^ meta.block.while.ruby punctuation.separator.method.ruby
#                        ^^^^ meta.block.while.ruby meta.function-call.ruby entity.name.function.ruby
#                            ^ meta.block.while.ruby
#                             ^^ meta.block.while.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                               ^ meta.block.while.ruby meta.block.do.ruby
#                                ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                 ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                  ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                   ^ meta.block.while.ruby meta.block.do.ruby
#                                    ^^^^ meta.block.while.ruby meta.block.do.ruby support.function.kernel.ruby
#                                        ^ meta.block.while.ruby meta.block.do.ruby
#                                         ^ meta.block.while.ruby meta.block.do.ruby variable.other.ruby
#                                          ^ meta.block.while.ruby meta.block.do.ruby
#                                           ^^^ meta.block.while.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                              ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                               ^ meta.block.while.ruby
#                                                ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while false do [(0..10), (10..20)].each do |r| puts r.end end end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^^^^^ meta.block.while.ruby constant.language.boolean.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby punctuation.section.array.begin.ruby
#                 ^ meta.block.while.ruby punctuation.section.function.ruby
#                  ^ meta.block.while.ruby constant.numeric.ruby
#                   ^ meta.block.while.ruby punctuation.separator.method.ruby
#                    ^ meta.block.while.ruby punctuation.separator.method.ruby
#                     ^^ meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby punctuation.section.function.ruby
#                        ^ meta.block.while.ruby punctuation.separator.object.ruby
#                         ^ meta.block.while.ruby
#                          ^ meta.block.while.ruby punctuation.section.function.ruby
#                           ^^ meta.block.while.ruby constant.numeric.ruby
#                             ^ meta.block.while.ruby punctuation.separator.method.ruby
#                              ^ meta.block.while.ruby punctuation.separator.method.ruby
#                               ^^ meta.block.while.ruby constant.numeric.ruby
#                                 ^ meta.block.while.ruby punctuation.section.function.ruby
#                                  ^ meta.block.while.ruby punctuation.section.array.end.ruby
#                                   ^ meta.block.while.ruby punctuation.separator.method.ruby
#                                    ^^^^ meta.block.while.ruby meta.function-call.ruby entity.name.function.ruby
#                                        ^ meta.block.while.ruby
#                                         ^^ meta.block.while.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                                           ^ meta.block.while.ruby meta.block.do.ruby
#                                            ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                             ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                              ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                               ^ meta.block.while.ruby meta.block.do.ruby
#                                                ^^^^ meta.block.while.ruby meta.block.do.ruby support.function.kernel.ruby
#                                                    ^ meta.block.while.ruby meta.block.do.ruby
#                                                     ^ meta.block.while.ruby meta.block.do.ruby variable.other.ruby
#                                                      ^ meta.block.while.ruby meta.block.do.ruby punctuation.separator.method.ruby
#                                                       ^^^ meta.block.while.ruby meta.block.do.ruby meta.function-call.ruby entity.name.function.ruby
#                                                          ^ meta.block.while.ruby meta.block.do.ruby
#                                                           ^^^ meta.block.while.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
#                                                              ^ meta.block.while.ruby
#                                                               ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  while false do puts end?; puts end! end
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^^^^^ meta.block.while.ruby constant.language.boolean.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#               ^ meta.block.while.ruby
#                ^^^^ meta.block.while.ruby support.function.kernel.ruby
#                    ^ meta.block.while.ruby
#                     ^^^ meta.block.while.ruby variable.other.ruby
#                        ^ meta.block.while.ruby
#                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                          ^ meta.block.while.ruby
#                           ^^^^ meta.block.while.ruby support.function.kernel.ruby
#                               ^ meta.block.while.ruby
#                                ^^^ meta.block.while.ruby variable.other.ruby
#                                   ^^ meta.block.while.ruby
#                                     ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  [while i < 10 do break i if i == 5; i += 1; end]
# ^ punctuation.section.array.begin.ruby
#  ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby variable.other.ruby
#         ^ meta.block.while.ruby
#          ^ meta.block.while.ruby keyword.operator.comparison.ruby
#           ^ meta.block.while.ruby
#            ^^ meta.block.while.ruby constant.numeric.ruby
#              ^ meta.block.while.ruby
#               ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                 ^ meta.block.while.ruby
#                  ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                       ^ meta.block.while.ruby
#                        ^ meta.block.while.ruby variable.other.ruby
#                         ^ meta.block.while.ruby
#                          ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                            ^ meta.block.while.ruby
#                             ^ meta.block.while.ruby variable.other.ruby
#                              ^ meta.block.while.ruby
#                               ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                 ^ meta.block.while.ruby
#                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby variable.other.ruby
#                                      ^ meta.block.while.ruby
#                                       ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                           ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                ^ punctuation.section.array.end.ruby
  [ while i < 10 do break i if i == 5; i += 1 end, while i < 10 do break i if i == 6; i += 1 end ]
# ^ punctuation.section.array.begin.ruby
#  ^ meta.block.while.ruby
#   ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby variable.other.ruby
#          ^ meta.block.while.ruby
#           ^ meta.block.while.ruby keyword.operator.comparison.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby constant.numeric.ruby
#               ^ meta.block.while.ruby
#                ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                  ^ meta.block.while.ruby
#                   ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                        ^ meta.block.while.ruby
#                         ^ meta.block.while.ruby variable.other.ruby
#                          ^ meta.block.while.ruby
#                           ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                             ^ meta.block.while.ruby
#                              ^ meta.block.while.ruby variable.other.ruby
#                               ^ meta.block.while.ruby
#                                ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby constant.numeric.ruby
#                                    ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                     ^ meta.block.while.ruby
#                                      ^ meta.block.while.ruby variable.other.ruby
#                                       ^ meta.block.while.ruby
#                                        ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby constant.numeric.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                ^ punctuation.separator.object.ruby
#                                                 ^ meta.block.while.ruby
#                                                  ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#                                                       ^ meta.block.while.ruby
#                                                        ^ meta.block.while.ruby variable.other.ruby
#                                                         ^ meta.block.while.ruby
#                                                          ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                           ^ meta.block.while.ruby
#                                                            ^^ meta.block.while.ruby constant.numeric.ruby
#                                                              ^ meta.block.while.ruby
#                                                               ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                                                                 ^ meta.block.while.ruby
#                                                                  ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                                       ^ meta.block.while.ruby
#                                                                        ^ meta.block.while.ruby variable.other.ruby
#                                                                         ^ meta.block.while.ruby
#                                                                          ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                            ^ meta.block.while.ruby
#                                                                             ^ meta.block.while.ruby variable.other.ruby
#                                                                              ^ meta.block.while.ruby
#                                                                               ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                                 ^ meta.block.while.ruby
#                                                                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                    ^ meta.block.while.ruby
#                                                                                     ^ meta.block.while.ruby variable.other.ruby
#                                                                                      ^ meta.block.while.ruby
#                                                                                       ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                                         ^ meta.block.while.ruby
#                                                                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                           ^ meta.block.while.ruby
#                                                                                            ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                                                                ^ punctuation.section.array.end.ruby
  {while i < 10 do break i if i == 5; i += 1 end => 1}
# ^ punctuation.section.scope.begin.ruby
#  ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby variable.other.ruby
#         ^ meta.block.while.ruby
#          ^ meta.block.while.ruby keyword.operator.comparison.ruby
#           ^ meta.block.while.ruby
#            ^^ meta.block.while.ruby constant.numeric.ruby
#              ^ meta.block.while.ruby
#               ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                 ^ meta.block.while.ruby
#                  ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                       ^ meta.block.while.ruby
#                        ^ meta.block.while.ruby variable.other.ruby
#                         ^ meta.block.while.ruby
#                          ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                            ^ meta.block.while.ruby
#                             ^ meta.block.while.ruby variable.other.ruby
#                              ^ meta.block.while.ruby
#                               ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                 ^ meta.block.while.ruby
#                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby variable.other.ruby
#                                      ^ meta.block.while.ruby
#                                       ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                           ^ meta.block.while.ruby
#                                            ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                ^^ punctuation.separator.key-value
#                                                   ^ constant.numeric.ruby
#                                                    ^ punctuation.section.scope.end.ruby
  { while i < 10 do break i if i == 5; i += 1 end => 1 }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.block.while.ruby
#   ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby variable.other.ruby
#          ^ meta.block.while.ruby
#           ^ meta.block.while.ruby keyword.operator.comparison.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby constant.numeric.ruby
#               ^ meta.block.while.ruby
#                ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                  ^ meta.block.while.ruby
#                   ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                        ^ meta.block.while.ruby
#                         ^ meta.block.while.ruby variable.other.ruby
#                          ^ meta.block.while.ruby
#                           ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                             ^ meta.block.while.ruby
#                              ^ meta.block.while.ruby variable.other.ruby
#                               ^ meta.block.while.ruby
#                                ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby constant.numeric.ruby
#                                    ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                     ^ meta.block.while.ruby
#                                      ^ meta.block.while.ruby variable.other.ruby
#                                       ^ meta.block.while.ruby
#                                        ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby constant.numeric.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                 ^^ punctuation.separator.key-value
#                                                    ^ constant.numeric.ruby
#                                                      ^ punctuation.section.scope.end.ruby
  {foo: while i < 10 do break i if i == 5; i += 1 end}
# ^ punctuation.section.scope.begin.ruby
#  ^^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#      ^ meta.block.while.ruby
#       ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#            ^ meta.block.while.ruby
#             ^ meta.block.while.ruby variable.other.ruby
#              ^ meta.block.while.ruby
#               ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                ^ meta.block.while.ruby
#                 ^^ meta.block.while.ruby constant.numeric.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                      ^ meta.block.while.ruby
#                       ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                            ^ meta.block.while.ruby
#                             ^ meta.block.while.ruby variable.other.ruby
#                              ^ meta.block.while.ruby
#                               ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                 ^ meta.block.while.ruby
#                                  ^ meta.block.while.ruby variable.other.ruby
#                                   ^ meta.block.while.ruby
#                                    ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                      ^ meta.block.while.ruby
#                                       ^ meta.block.while.ruby constant.numeric.ruby
#                                        ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby variable.other.ruby
#                                           ^ meta.block.while.ruby
#                                            ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                              ^ meta.block.while.ruby
#                                               ^ meta.block.while.ruby constant.numeric.ruby
#                                                ^ meta.block.while.ruby
#                                                 ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                    ^ punctuation.section.scope.end.ruby
  { foo: while i < 10 do break i if i == 5; i += 1 end, bar:while i < 10 do break i if i == 6; i += 1 end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^ meta.block.while.ruby
#        ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#             ^ meta.block.while.ruby
#              ^ meta.block.while.ruby variable.other.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                 ^ meta.block.while.ruby
#                  ^^ meta.block.while.ruby constant.numeric.ruby
#                    ^ meta.block.while.ruby
#                     ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                       ^ meta.block.while.ruby
#                        ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                             ^ meta.block.while.ruby
#                              ^ meta.block.while.ruby variable.other.ruby
#                               ^ meta.block.while.ruby
#                                ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby variable.other.ruby
#                                    ^ meta.block.while.ruby
#                                     ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                       ^ meta.block.while.ruby
#                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                         ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby variable.other.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                               ^ meta.block.while.ruby
#                                                ^ meta.block.while.ruby constant.numeric.ruby
#                                                 ^ meta.block.while.ruby
#                                                  ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                     ^ punctuation.separator.object.ruby
#                                                       ^^^ constant.language.symbol.hashkey.ruby
#                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                           ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#                                                                ^ meta.block.while.ruby
#                                                                 ^ meta.block.while.ruby variable.other.ruby
#                                                                  ^ meta.block.while.ruby
#                                                                   ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                    ^ meta.block.while.ruby
#                                                                     ^^ meta.block.while.ruby constant.numeric.ruby
#                                                                       ^ meta.block.while.ruby
#                                                                        ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                                                                          ^ meta.block.while.ruby
#                                                                           ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                                                ^ meta.block.while.ruby
#                                                                                 ^ meta.block.while.ruby variable.other.ruby
#                                                                                  ^ meta.block.while.ruby
#                                                                                   ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                                     ^ meta.block.while.ruby
#                                                                                      ^ meta.block.while.ruby variable.other.ruby
#                                                                                       ^ meta.block.while.ruby
#                                                                                        ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                                          ^ meta.block.while.ruby
#                                                                                           ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                            ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                             ^ meta.block.while.ruby
#                                                                                              ^ meta.block.while.ruby variable.other.ruby
#                                                                                               ^ meta.block.while.ruby
#                                                                                                ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                                                  ^ meta.block.while.ruby
#                                                                                                   ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                                    ^ meta.block.while.ruby
#                                                                                                     ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                                                                         ^ punctuation.section.scope.end.ruby
  {:foo => while i < 10 do break i if i == 5; i += 1 end}
# ^ punctuation.section.scope.begin.ruby
#  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#   ^^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#         ^ meta.block.while.ruby
#          ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#               ^ meta.block.while.ruby
#                ^ meta.block.while.ruby variable.other.ruby
#                 ^ meta.block.while.ruby
#                  ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby constant.numeric.ruby
#                      ^ meta.block.while.ruby
#                       ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                         ^ meta.block.while.ruby
#                          ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                               ^ meta.block.while.ruby
#                                ^ meta.block.while.ruby variable.other.ruby
#                                 ^ meta.block.while.ruby
#                                  ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby variable.other.ruby
#                                      ^ meta.block.while.ruby
#                                       ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                           ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                            ^ meta.block.while.ruby
#                                             ^ meta.block.while.ruby variable.other.ruby
#                                              ^ meta.block.while.ruby
#                                               ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                 ^ meta.block.while.ruby
#                                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                                   ^ meta.block.while.ruby
#                                                    ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                       ^ punctuation.section.scope.end.ruby
  { :foo => while i < 10 do break i if i == 5; i += 1 end, :bar=>while i < 10 do break i if i == 6; i += 1 end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#          ^ meta.block.while.ruby
#           ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#                ^ meta.block.while.ruby
#                 ^ meta.block.while.ruby variable.other.ruby
#                  ^ meta.block.while.ruby
#                   ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                    ^ meta.block.while.ruby
#                     ^^ meta.block.while.ruby constant.numeric.ruby
#                       ^ meta.block.while.ruby
#                        ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                          ^ meta.block.while.ruby
#                           ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                ^ meta.block.while.ruby
#                                 ^ meta.block.while.ruby variable.other.ruby
#                                  ^ meta.block.while.ruby
#                                   ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                     ^ meta.block.while.ruby
#                                      ^ meta.block.while.ruby variable.other.ruby
#                                       ^ meta.block.while.ruby
#                                        ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby constant.numeric.ruby
#                                            ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                             ^ meta.block.while.ruby
#                                              ^ meta.block.while.ruby variable.other.ruby
#                                               ^ meta.block.while.ruby
#                                                ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                  ^ meta.block.while.ruby
#                                                   ^ meta.block.while.ruby constant.numeric.ruby
#                                                    ^ meta.block.while.ruby
#                                                     ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                        ^ punctuation.separator.object.ruby
#                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#                                                           ^^^ constant.language.symbol.hashkey.ruby
#                                                              ^^ punctuation.separator.key-value
#                                                                ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#                                                                     ^ meta.block.while.ruby
#                                                                      ^ meta.block.while.ruby variable.other.ruby
#                                                                       ^ meta.block.while.ruby
#                                                                        ^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                         ^ meta.block.while.ruby
#                                                                          ^^ meta.block.while.ruby constant.numeric.ruby
#                                                                            ^ meta.block.while.ruby
#                                                                             ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                                                                               ^ meta.block.while.ruby
#                                                                                ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                                                                                     ^ meta.block.while.ruby
#                                                                                      ^ meta.block.while.ruby variable.other.ruby
#                                                                                       ^ meta.block.while.ruby
#                                                                                        ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                                                                                          ^ meta.block.while.ruby
#                                                                                           ^ meta.block.while.ruby variable.other.ruby
#                                                                                            ^ meta.block.while.ruby
#                                                                                             ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                                                                               ^ meta.block.while.ruby
#                                                                                                ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                                 ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                                                                                  ^ meta.block.while.ruby
#                                                                                                   ^ meta.block.while.ruby variable.other.ruby
#                                                                                                    ^ meta.block.while.ruby
#                                                                                                     ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                                                                                       ^ meta.block.while.ruby
#                                                                                                        ^ meta.block.while.ruby constant.numeric.ruby
#                                                                                                         ^ meta.block.while.ruby
#                                                                                                          ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                                                                              ^ punctuation.section.scope.end.ruby
  (while i < 10 do break i if i == 5; i += 1 end)
# ^ punctuation.section.function.ruby
#  ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby variable.other.ruby
#         ^ meta.block.while.ruby
#          ^ meta.block.while.ruby keyword.operator.comparison.ruby
#           ^ meta.block.while.ruby
#            ^^ meta.block.while.ruby constant.numeric.ruby
#              ^ meta.block.while.ruby
#               ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                 ^ meta.block.while.ruby
#                  ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                       ^ meta.block.while.ruby
#                        ^ meta.block.while.ruby variable.other.ruby
#                         ^ meta.block.while.ruby
#                          ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                            ^ meta.block.while.ruby
#                             ^ meta.block.while.ruby variable.other.ruby
#                              ^ meta.block.while.ruby
#                               ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                 ^ meta.block.while.ruby
#                                  ^ meta.block.while.ruby constant.numeric.ruby
#                                   ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                    ^ meta.block.while.ruby
#                                     ^ meta.block.while.ruby variable.other.ruby
#                                      ^ meta.block.while.ruby
#                                       ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                         ^ meta.block.while.ruby
#                                          ^ meta.block.while.ruby constant.numeric.ruby
#                                           ^ meta.block.while.ruby
#                                            ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                               ^ punctuation.section.function.ruby
  ( while i < 10 do break i if i == 5; i += 1 end )
# ^ punctuation.section.function.ruby
#  ^ meta.block.while.ruby
#   ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby variable.other.ruby
#          ^ meta.block.while.ruby
#           ^ meta.block.while.ruby keyword.operator.comparison.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby constant.numeric.ruby
#               ^ meta.block.while.ruby
#                ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                  ^ meta.block.while.ruby
#                   ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#                        ^ meta.block.while.ruby
#                         ^ meta.block.while.ruby variable.other.ruby
#                          ^ meta.block.while.ruby
#                           ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                             ^ meta.block.while.ruby
#                              ^ meta.block.while.ruby variable.other.ruby
#                               ^ meta.block.while.ruby
#                                ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                                  ^ meta.block.while.ruby
#                                   ^ meta.block.while.ruby constant.numeric.ruby
#                                    ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                                     ^ meta.block.while.ruby
#                                      ^ meta.block.while.ruby variable.other.ruby
#                                       ^ meta.block.while.ruby
#                                        ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                          ^ meta.block.while.ruby
#                                           ^ meta.block.while.ruby constant.numeric.ruby
#                                            ^ meta.block.while.ruby
#                                             ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                 ^ punctuation.section.function.ruby

  foo::while false                              # shouldn't work
# ^^^ variable.other.ruby
#    ^^ punctuation.separator.method.ruby
#      ^^^^^ meta.function-call.ruby entity.name.function.ruby
#            ^^^^^ constant.language.boolean.ruby
#                                               ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  while? false                                  # shouldn't work
# ^^^^^ variable.other.ruby
#        ^^^^^ constant.language.boolean.ruby
#                                               ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  while! false                                  # shouldn't work
# ^^^^^ variable.other.ruby
#        ^^^^^ constant.language.boolean.ruby
#                                               ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  foo.while false                               # shouldn't work
# ^^^ variable.other.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^ meta.function-call.ruby entity.name.function.ruby
#           ^^^^^ constant.language.boolean.ruby
#                                               ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  acc = 0
# ^^^ variable.other.ruby
#     ^ keyword.operator.assignment.ruby
#       ^ constant.numeric.ruby
  acc += 10 while acc < 1000
# ^^^ variable.other.ruby
#     ^^ keyword.operator.assignment.augmented.ruby
#        ^^ constant.numeric.ruby
#           ^^^^^ keyword.control.modifier.while.ruby
#                 ^^^ variable.other.ruby
#                     ^ keyword.operator.comparison.ruby
#                       ^^^^ constant.numeric.ruby
  a = /regex/ while acc < 10
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#      ^^^^^ string.regexp.interpolated.ruby
#           ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#             ^^^^^ keyword.control.modifier.while.ruby
#                   ^^^ variable.other.ruby
#                       ^ keyword.operator.comparison.ruby
#                         ^^ constant.numeric.ruby
  {} while false
# ^ punctuation.section.scope.begin.ruby
#  ^ punctuation.section.scope.end.ruby
#    ^^^^^ keyword.control.modifier.while.ruby
#          ^^^^^ constant.language.boolean.ruby
  [] while false
# ^ punctuation.section.array.begin.ruby
#  ^ punctuation.section.array.end.ruby
#    ^^^^^ keyword.control.modifier.while.ruby
#          ^^^^^ constant.language.boolean.ruby
  "foo" while false
# ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#  ^^^ string.quoted.double.interpolated.ruby
#     ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#       ^^^^^ keyword.control.modifier.while.ruby
#             ^^^^^ constant.language.boolean.ruby
  'foo' while false
# ^ string.quoted.single.ruby punctuation.definition.string.begin.ruby
#  ^^^ string.quoted.single.ruby
#     ^ string.quoted.single.ruby punctuation.definition.string.end.ruby
#       ^^^^^ keyword.control.modifier.while.ruby
#             ^^^^^ constant.language.boolean.ruby
  (expression) while false
# ^ punctuation.section.function.ruby
#  ^^^^^^^^^^ variable.other.ruby
#            ^ punctuation.section.function.ruby
#              ^^^^^ keyword.control.modifier.while.ruby
#                    ^^^^^ constant.language.boolean.ruby
  foo! while false
# ^^^ variable.other.ruby
#      ^^^^^ keyword.control.modifier.while.ruby
#            ^^^^^ constant.language.boolean.ruby
  foo? while false
# ^^^ variable.other.ruby
#      ^^^^^ keyword.control.modifier.while.ruby
#            ^^^^^ constant.language.boolean.ruby
  method_without_args while false
# ^^^^^^^^^^^^^^^^^^^ variable.other.ruby
#                     ^^^^^ keyword.control.modifier.while.ruby
#                           ^^^^^ constant.language.boolean.ruby
  method(with, args) while false
# ^^^^^^ meta.function-call.ruby entity.name.function.ruby
#       ^ meta.function-call.ruby punctuation.section.function.ruby
#        ^^^^ meta.function-call.ruby variable.other.ruby
#            ^ meta.function-call.ruby punctuation.separator.object.ruby
#             ^ meta.function-call.ruby
#              ^^^^ meta.function-call.ruby variable.other.ruby
#                  ^ meta.function-call.ruby punctuation.section.function.ruby
#                    ^^^^^ keyword.control.modifier.while.ruby
#                          ^^^^^ constant.language.boolean.ruby
  method with, args while false
# ^^^^^^ variable.other.ruby
#        ^^^^ variable.other.ruby
#            ^ punctuation.separator.object.ruby
#              ^^^^ variable.other.ruby
#                   ^^^^^ keyword.control.modifier.while.ruby
#                         ^^^^^ constant.language.boolean.ruby
  `ls` while false
# ^ string.interpolated.ruby punctuation.definition.string.begin.ruby
#  ^^ string.interpolated.ruby
#    ^ string.interpolated.ruby punctuation.definition.string.end.ruby
#      ^^^^^ keyword.control.modifier.while.ruby
#            ^^^^^ constant.language.boolean.ruby

  while i < 10
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby
#           ^^ meta.block.while.ruby constant.numeric.ruby
    i += 1
#^^^ meta.block.while.ruby
#   ^ meta.block.while.ruby variable.other.ruby
#    ^ meta.block.while.ruby
#     ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby constant.numeric.ruby
  end
#^ meta.block.while.ruby
# ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  
  while i < 10 do
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^ meta.block.while.ruby variable.other.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby keyword.operator.comparison.ruby
#          ^ meta.block.while.ruby
#           ^^ meta.block.while.ruby constant.numeric.ruby
#             ^ meta.block.while.ruby
#              ^^ meta.block.while.ruby keyword.control.optional.do.ruby
    i += 1
#^^^ meta.block.while.ruby
#   ^ meta.block.while.ruby variable.other.ruby
#    ^ meta.block.while.ruby
#     ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby constant.numeric.ruby
  end
#^ meta.block.while.ruby
# ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  
  10 / while i < 10 do
# ^^ constant.numeric.ruby
#    ^ keyword.operator.arithmetic.ruby
#     ^ meta.block.while.ruby
#      ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#           ^ meta.block.while.ruby
#            ^ meta.block.while.ruby variable.other.ruby
#             ^ meta.block.while.ruby
#              ^ meta.block.while.ruby keyword.operator.comparison.ruby
#               ^ meta.block.while.ruby
#                ^^ meta.block.while.ruby constant.numeric.ruby
#                  ^ meta.block.while.ruby
#                   ^^ meta.block.while.ruby keyword.control.optional.do.ruby
    break i if i == 5
#^^^ meta.block.while.ruby
#   ^^^^^ meta.block.while.ruby keyword.control.pseudo-method.ruby
#        ^ meta.block.while.ruby
#         ^ meta.block.while.ruby variable.other.ruby
#          ^ meta.block.while.ruby
#           ^^ meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#             ^ meta.block.while.ruby
#              ^ meta.block.while.ruby variable.other.ruby
#               ^ meta.block.while.ruby
#                ^^ meta.block.while.ruby keyword.operator.comparison.ruby
#                  ^ meta.block.while.ruby
#                   ^ meta.block.while.ruby constant.numeric.ruby
    i += 1
#^^^ meta.block.while.ruby
#   ^ meta.block.while.ruby variable.other.ruby
#    ^ meta.block.while.ruby
#     ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#       ^ meta.block.while.ruby
#        ^ meta.block.while.ruby constant.numeric.ruby
  end
#^ meta.block.while.ruby
# ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby

  while false do
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^^^^^ meta.block.while.ruby constant.language.boolean.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby keyword.control.optional.do.ruby
    [(0..10), (10..20)].each do |r|
#^^^ meta.block.while.ruby
#   ^ meta.block.while.ruby punctuation.section.array.begin.ruby
#    ^ meta.block.while.ruby punctuation.section.function.ruby
#     ^ meta.block.while.ruby constant.numeric.ruby
#      ^ meta.block.while.ruby punctuation.separator.method.ruby
#       ^ meta.block.while.ruby punctuation.separator.method.ruby
#        ^^ meta.block.while.ruby constant.numeric.ruby
#          ^ meta.block.while.ruby punctuation.section.function.ruby
#           ^ meta.block.while.ruby punctuation.separator.object.ruby
#            ^ meta.block.while.ruby
#             ^ meta.block.while.ruby punctuation.section.function.ruby
#              ^^ meta.block.while.ruby constant.numeric.ruby
#                ^ meta.block.while.ruby punctuation.separator.method.ruby
#                 ^ meta.block.while.ruby punctuation.separator.method.ruby
#                  ^^ meta.block.while.ruby constant.numeric.ruby
#                    ^ meta.block.while.ruby punctuation.section.function.ruby
#                     ^ meta.block.while.ruby punctuation.section.array.end.ruby
#                      ^ meta.block.while.ruby punctuation.separator.method.ruby
#                       ^^^^ meta.block.while.ruby meta.function-call.ruby entity.name.function.ruby
#                           ^ meta.block.while.ruby
#                            ^^ meta.block.while.ruby meta.block.do.ruby keyword.control.do.begin.ruby
#                              ^ meta.block.while.ruby meta.block.do.ruby
#                               ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                 ^ meta.block.while.ruby meta.block.do.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
      puts r.end
#^^^^^ meta.block.while.ruby meta.block.do.ruby
#     ^^^^ meta.block.while.ruby meta.block.do.ruby support.function.kernel.ruby
#         ^ meta.block.while.ruby meta.block.do.ruby
#          ^ meta.block.while.ruby meta.block.do.ruby variable.other.ruby
#           ^ meta.block.while.ruby meta.block.do.ruby punctuation.separator.method.ruby
#            ^^^ meta.block.while.ruby meta.block.do.ruby meta.function-call.ruby entity.name.function.ruby
    end
#^^^ meta.block.while.ruby meta.block.do.ruby
#   ^^^ meta.block.while.ruby meta.block.do.ruby keyword.control.end.ruby keyword.control.do.end.ruby
  end
#^ meta.block.while.ruby
# ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby

  while false do
#^ meta.block.while.ruby
# ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#      ^ meta.block.while.ruby
#       ^^^^^ meta.block.while.ruby constant.language.boolean.ruby
#            ^ meta.block.while.ruby
#             ^^ meta.block.while.ruby keyword.control.optional.do.ruby
    puts end?
#^^^ meta.block.while.ruby
#   ^^^^ meta.block.while.ruby support.function.kernel.ruby
#       ^ meta.block.while.ruby
#        ^^^ meta.block.while.ruby variable.other.ruby
#           ^^ meta.block.while.ruby
    puts end!
#^^^ meta.block.while.ruby
#   ^^^^ meta.block.while.ruby support.function.kernel.ruby
#       ^ meta.block.while.ruby
#        ^^^ meta.block.while.ruby variable.other.ruby
#           ^^ meta.block.while.ruby
  end
#^ meta.block.while.ruby
# ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    i += 1
#^^^ meta.block.begin.ruby
#   ^ meta.block.begin.ruby variable.other.ruby
#    ^ meta.block.begin.ruby
#     ^^ meta.block.begin.ruby keyword.operator.assignment.augmented.ruby
#       ^ meta.block.begin.ruby
#        ^ meta.block.begin.ruby constant.numeric.ruby
  end; while i < 100 do i += 1; end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
#    ^ punctuation.separator.statement.ruby
#     ^ meta.block.while.ruby
#      ^^^^^ meta.block.while.ruby keyword.control.while.begin.ruby
#           ^ meta.block.while.ruby
#            ^ meta.block.while.ruby variable.other.ruby
#             ^ meta.block.while.ruby
#              ^ meta.block.while.ruby keyword.operator.comparison.ruby
#               ^ meta.block.while.ruby
#                ^^^ meta.block.while.ruby constant.numeric.ruby
#                   ^ meta.block.while.ruby
#                    ^^ meta.block.while.ruby keyword.control.optional.do.ruby
#                      ^ meta.block.while.ruby
#                       ^ meta.block.while.ruby variable.other.ruby
#                        ^ meta.block.while.ruby
#                         ^^ meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                           ^ meta.block.while.ruby
#                            ^ meta.block.while.ruby constant.numeric.ruby
#                             ^ meta.block.while.ruby punctuation.separator.statement.ruby
#                              ^ meta.block.while.ruby
#                               ^^^ meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
  
  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    i += 1
#^^^ meta.block.begin.ruby
#   ^ meta.block.begin.ruby variable.other.ruby
#    ^ meta.block.begin.ruby
#     ^^ meta.block.begin.ruby keyword.operator.assignment.augmented.ruby
#       ^ meta.block.begin.ruby
#        ^ meta.block.begin.ruby constant.numeric.ruby
  end while i < 100
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
#     ^^^^^ keyword.control.modifier.while.ruby
#           ^ variable.other.ruby
#             ^ keyword.operator.comparison.ruby
#               ^^^ constant.numeric.ruby

  1..if true; 10 else 20 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#      ^ meta.block.if.ruby
#       ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#           ^ meta.block.if.ruby punctuation.separator.statement.ruby
#            ^ meta.block.if.ruby
#             ^^ meta.block.if.ruby constant.numeric.ruby
#               ^ meta.block.if.ruby
#                ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                    ^ meta.block.if.ruby
#                     ^^ meta.block.if.ruby constant.numeric.ruby
#                       ^ meta.block.if.ruby
#                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  1...if true then 10 else 20 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^ punctuation.separator.method.ruby
#     ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#       ^ meta.block.if.ruby
#        ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#            ^ meta.block.if.ruby
#             ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                 ^ meta.block.if.ruby
#                  ^^ meta.block.if.ruby constant.numeric.ruby
#                    ^ meta.block.if.ruby
#                     ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                         ^ meta.block.if.ruby
#                          ^^ meta.block.if.ruby constant.numeric.ruby
#                            ^ meta.block.if.ruby
#                             ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if while i < 10 do break i if i == 5; i += 1; end < 10 then true else false end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby meta.block.while.ruby
#    ^^^^^ meta.block.if.ruby meta.block.while.ruby keyword.control.while.begin.ruby
#         ^ meta.block.if.ruby meta.block.while.ruby
#          ^ meta.block.if.ruby meta.block.while.ruby variable.other.ruby
#           ^ meta.block.if.ruby meta.block.while.ruby
#            ^ meta.block.if.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#             ^ meta.block.if.ruby meta.block.while.ruby
#              ^^ meta.block.if.ruby meta.block.while.ruby constant.numeric.ruby
#                ^ meta.block.if.ruby meta.block.while.ruby
#                 ^^ meta.block.if.ruby meta.block.while.ruby keyword.control.optional.do.ruby
#                   ^ meta.block.if.ruby meta.block.while.ruby
#                    ^^^^^ meta.block.if.ruby meta.block.while.ruby keyword.control.pseudo-method.ruby
#                         ^ meta.block.if.ruby meta.block.while.ruby
#                          ^ meta.block.if.ruby meta.block.while.ruby variable.other.ruby
#                           ^ meta.block.if.ruby meta.block.while.ruby
#                            ^^ meta.block.if.ruby meta.block.while.ruby keyword.control.modifier.conditional.if.ruby
#                              ^ meta.block.if.ruby meta.block.while.ruby
#                               ^ meta.block.if.ruby meta.block.while.ruby variable.other.ruby
#                                ^ meta.block.if.ruby meta.block.while.ruby
#                                 ^^ meta.block.if.ruby meta.block.while.ruby keyword.operator.comparison.ruby
#                                   ^ meta.block.if.ruby meta.block.while.ruby
#                                    ^ meta.block.if.ruby meta.block.while.ruby constant.numeric.ruby
#                                     ^ meta.block.if.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                      ^ meta.block.if.ruby meta.block.while.ruby
#                                       ^ meta.block.if.ruby meta.block.while.ruby variable.other.ruby
#                                        ^ meta.block.if.ruby meta.block.while.ruby
#                                         ^^ meta.block.if.ruby meta.block.while.ruby keyword.operator.assignment.augmented.ruby
#                                           ^ meta.block.if.ruby meta.block.while.ruby
#                                            ^ meta.block.if.ruby meta.block.while.ruby constant.numeric.ruby
#                                             ^ meta.block.if.ruby meta.block.while.ruby punctuation.separator.statement.ruby
#                                              ^ meta.block.if.ruby meta.block.while.ruby
#                                               ^^^ meta.block.if.ruby meta.block.while.ruby keyword.control.end.ruby keyword.control.while.end.ruby
#                                                  ^ meta.block.if.ruby
#                                                   ^ meta.block.if.ruby keyword.operator.comparison.ruby
#                                                    ^ meta.block.if.ruby
#                                                     ^^ meta.block.if.ruby constant.numeric.ruby
#                                                       ^ meta.block.if.ruby
#                                                        ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                                            ^ meta.block.if.ruby
#                                                             ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                                 ^ meta.block.if.ruby
#                                                                  ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                                      ^ meta.block.if.ruby
#                                                                       ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                                            ^ meta.block.if.ruby
#                                                                             ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if true then 1 else 2 end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#        ^ meta.block.if.ruby
#         ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#             ^ meta.block.if.ruby
#              ^ meta.block.if.ruby constant.numeric.ruby
#               ^ meta.block.if.ruby
#                ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                    ^ meta.block.if.ruby
#                     ^ meta.block.if.ruby constant.numeric.ruby
#                      ^ meta.block.if.ruby
#                       ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  true ? if true then true else false end : if true then true else false end
# ^^^^ constant.language.boolean.ruby
#      ^ keyword.operator.comparison.ruby
#       ^ meta.block.if.ruby
#        ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#          ^ meta.block.if.ruby
#           ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#               ^ meta.block.if.ruby
#                ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                    ^ meta.block.if.ruby
#                     ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                         ^ meta.block.if.ruby
#                          ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                              ^ meta.block.if.ruby
#                               ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                    ^ meta.block.if.ruby
#                                     ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                         ^ punctuation.separator.other.ruby
#                                          ^ meta.block.if.ruby
#                                           ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                                             ^ meta.block.if.ruby
#                                              ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                  ^ meta.block.if.ruby
#                                                   ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                                       ^ meta.block.if.ruby
#                                                        ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                            ^ meta.block.if.ruby
#                                                             ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                                 ^ meta.block.if.ruby
#                                                                  ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                                       ^ meta.block.if.ruby
#                                                                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if if true then true else false end; 1 else 0 end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby meta.block.if.ruby
#    ^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#      ^ meta.block.if.ruby meta.block.if.ruby
#       ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#           ^ meta.block.if.ruby meta.block.if.ruby
#            ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.then.ruby
#                ^ meta.block.if.ruby meta.block.if.ruby
#                 ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                     ^ meta.block.if.ruby meta.block.if.ruby
#                      ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                          ^ meta.block.if.ruby meta.block.if.ruby
#                           ^^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                                ^ meta.block.if.ruby meta.block.if.ruby
#                                 ^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                    ^ meta.block.if.ruby punctuation.separator.statement.ruby
#                                     ^ meta.block.if.ruby
#                                      ^ meta.block.if.ruby constant.numeric.ruby
#                                       ^ meta.block.if.ruby
#                                        ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                            ^ meta.block.if.ruby
#                                             ^ meta.block.if.ruby constant.numeric.ruby
#                                              ^ meta.block.if.ruby
#                                               ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if if true then true else false end then 1 else 0 end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby meta.block.if.ruby
#    ^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#      ^ meta.block.if.ruby meta.block.if.ruby
#       ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#           ^ meta.block.if.ruby meta.block.if.ruby
#            ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.then.ruby
#                ^ meta.block.if.ruby meta.block.if.ruby
#                 ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                     ^ meta.block.if.ruby meta.block.if.ruby
#                      ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                          ^ meta.block.if.ruby meta.block.if.ruby
#                           ^^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                                ^ meta.block.if.ruby meta.block.if.ruby
#                                 ^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                    ^ meta.block.if.ruby
#                                     ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                         ^ meta.block.if.ruby
#                                          ^ meta.block.if.ruby constant.numeric.ruby
#                                           ^ meta.block.if.ruby
#                                            ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                ^ meta.block.if.ruby
#                                                 ^ meta.block.if.ruby constant.numeric.ruby
#                                                  ^ meta.block.if.ruby
#                                                   ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if if true; true else false end then 1 else 0 end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby meta.block.if.ruby
#    ^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#      ^ meta.block.if.ruby meta.block.if.ruby
#       ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#           ^ meta.block.if.ruby meta.block.if.ruby punctuation.separator.statement.ruby
#            ^ meta.block.if.ruby meta.block.if.ruby
#             ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                 ^ meta.block.if.ruby meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                      ^ meta.block.if.ruby meta.block.if.ruby
#                       ^^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                            ^ meta.block.if.ruby meta.block.if.ruby
#                             ^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                ^ meta.block.if.ruby
#                                 ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                     ^ meta.block.if.ruby
#                                      ^ meta.block.if.ruby constant.numeric.ruby
#                                       ^ meta.block.if.ruby
#                                        ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                            ^ meta.block.if.ruby
#                                             ^ meta.block.if.ruby constant.numeric.ruby
#                                              ^ meta.block.if.ruby
#                                               ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if if true; true else false end; 1 else 0 end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby meta.block.if.ruby
#    ^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#      ^ meta.block.if.ruby meta.block.if.ruby
#       ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#           ^ meta.block.if.ruby meta.block.if.ruby punctuation.separator.statement.ruby
#            ^ meta.block.if.ruby meta.block.if.ruby
#             ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                 ^ meta.block.if.ruby meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                      ^ meta.block.if.ruby meta.block.if.ruby
#                       ^^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
#                            ^ meta.block.if.ruby meta.block.if.ruby
#                             ^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                ^ meta.block.if.ruby punctuation.separator.statement.ruby
#                                 ^ meta.block.if.ruby
#                                  ^ meta.block.if.ruby constant.numeric.ruby
#                                   ^ meta.block.if.ruby
#                                    ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                        ^ meta.block.if.ruby
#                                         ^ meta.block.if.ruby constant.numeric.ruby
#                                          ^ meta.block.if.ruby
#                                           ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  20 / if true then 10 else 5 end
# ^^ constant.numeric.ruby
#    ^ keyword.operator.arithmetic.ruby
#     ^ meta.block.if.ruby
#      ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#        ^ meta.block.if.ruby
#         ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#             ^ meta.block.if.ruby
#              ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                  ^ meta.block.if.ruby
#                   ^^ meta.block.if.ruby constant.numeric.ruby
#                     ^ meta.block.if.ruby
#                      ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                          ^ meta.block.if.ruby
#                           ^ meta.block.if.ruby constant.numeric.ruby
#                            ^ meta.block.if.ruby
#                             ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  20 / if true; 10 else 5 end
# ^^ constant.numeric.ruby
#    ^ keyword.operator.arithmetic.ruby
#     ^ meta.block.if.ruby
#      ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#        ^ meta.block.if.ruby
#         ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#             ^ meta.block.if.ruby punctuation.separator.statement.ruby
#              ^ meta.block.if.ruby
#               ^^ meta.block.if.ruby constant.numeric.ruby
#                 ^ meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                      ^ meta.block.if.ruby
#                       ^ meta.block.if.ruby constant.numeric.ruby
#                        ^ meta.block.if.ruby
#                         ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  !if true then true else false end
# ^ keyword.operator.logical.ruby
#  ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#    ^ meta.block.if.ruby
#     ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#         ^ meta.block.if.ruby
#          ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#              ^ meta.block.if.ruby
#               ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                   ^ meta.block.if.ruby
#                    ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                        ^ meta.block.if.ruby
#                         ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                              ^ meta.block.if.ruby
#                               ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  ! if true then true else false end
# ^ keyword.operator.logical.ruby
#  ^ meta.block.if.ruby
#   ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#     ^ meta.block.if.ruby
#      ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#          ^ meta.block.if.ruby
#           ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#               ^ meta.block.if.ruby
#                ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                    ^ meta.block.if.ruby
#                     ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                         ^ meta.block.if.ruby
#                          ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                               ^ meta.block.if.ruby
#                                ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  true && !if true then true else false end
# ^^^^ constant.language.boolean.ruby
#      ^^ keyword.operator.logical.ruby
#         ^ keyword.operator.logical.ruby
#          ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#            ^ meta.block.if.ruby
#             ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                 ^ meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                      ^ meta.block.if.ruby
#                       ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                           ^ meta.block.if.ruby
#                            ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                ^ meta.block.if.ruby
#                                 ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                      ^ meta.block.if.ruby
#                                       ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  true && ! if true then true else false end
# ^^^^ constant.language.boolean.ruby
#      ^^ keyword.operator.logical.ruby
#         ^ keyword.operator.logical.ruby
#          ^ meta.block.if.ruby
#           ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#             ^ meta.block.if.ruby
#              ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                  ^ meta.block.if.ruby
#                   ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                       ^ meta.block.if.ruby
#                        ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                            ^ meta.block.if.ruby
#                             ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                 ^ meta.block.if.ruby
#                                  ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                       ^ meta.block.if.ruby
#                                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  a = /hello/; 20 / if true then 1 else 2 end
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#      ^^^^^ string.regexp.interpolated.ruby
#           ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#            ^ punctuation.separator.statement.ruby
#              ^^ constant.numeric.ruby
#                 ^ keyword.operator.arithmetic.ruby
#                  ^ meta.block.if.ruby
#                   ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                     ^ meta.block.if.ruby
#                      ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                          ^ meta.block.if.ruby
#                           ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                               ^ meta.block.if.ruby
#                                ^ meta.block.if.ruby constant.numeric.ruby
#                                 ^ meta.block.if.ruby
#                                  ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                      ^ meta.block.if.ruby
#                                       ^ meta.block.if.ruby constant.numeric.ruby
#                                        ^ meta.block.if.ruby
#                                         ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  a = 2 > if true then 1 else 2 end
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^ constant.numeric.ruby
#       ^ keyword.operator.comparison.ruby
#        ^ meta.block.if.ruby
#         ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#           ^ meta.block.if.ruby
#            ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                ^ meta.block.if.ruby
#                 ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                     ^ meta.block.if.ruby
#                      ^ meta.block.if.ruby constant.numeric.ruby
#                       ^ meta.block.if.ruby
#                        ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                            ^ meta.block.if.ruby
#                             ^ meta.block.if.ruby constant.numeric.ruby
#                              ^ meta.block.if.ruby
#                               ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  a = /hello/; if true then 1 else 2 end
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#      ^^^^^ string.regexp.interpolated.ruby
#           ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#            ^ punctuation.separator.statement.ruby
#             ^ meta.block.if.ruby
#              ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                ^ meta.block.if.ruby
#                 ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                     ^ meta.block.if.ruby
#                      ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                          ^ meta.block.if.ruby
#                           ^ meta.block.if.ruby constant.numeric.ruby
#                            ^ meta.block.if.ruby
#                             ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                 ^ meta.block.if.ruby
#                                  ^ meta.block.if.ruby constant.numeric.ruby
#                                   ^ meta.block.if.ruby
#                                    ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if true then puts (1..10).end else puts (1..20).end end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#        ^ meta.block.if.ruby
#         ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#             ^ meta.block.if.ruby
#              ^^^^ meta.block.if.ruby support.function.kernel.ruby
#                  ^ meta.block.if.ruby
#                   ^ meta.block.if.ruby punctuation.section.function.ruby
#                    ^ meta.block.if.ruby constant.numeric.ruby
#                     ^ meta.block.if.ruby punctuation.separator.method.ruby
#                      ^ meta.block.if.ruby punctuation.separator.method.ruby
#                       ^^ meta.block.if.ruby constant.numeric.ruby
#                         ^ meta.block.if.ruby punctuation.section.function.ruby
#                          ^ meta.block.if.ruby punctuation.separator.method.ruby
#                           ^^^ meta.block.if.ruby meta.function-call.ruby entity.name.function.ruby
#                              ^ meta.block.if.ruby
#                               ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                   ^ meta.block.if.ruby
#                                    ^^^^ meta.block.if.ruby support.function.kernel.ruby
#                                        ^ meta.block.if.ruby
#                                         ^ meta.block.if.ruby punctuation.section.function.ruby
#                                          ^ meta.block.if.ruby constant.numeric.ruby
#                                           ^ meta.block.if.ruby punctuation.separator.method.ruby
#                                            ^ meta.block.if.ruby punctuation.separator.method.ruby
#                                             ^^ meta.block.if.ruby constant.numeric.ruby
#                                               ^ meta.block.if.ruby punctuation.section.function.ruby
#                                                ^ meta.block.if.ruby punctuation.separator.method.ruby
#                                                 ^^^ meta.block.if.ruby meta.function-call.ruby entity.name.function.ruby
#                                                    ^ meta.block.if.ruby
#                                                     ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  if true then puts end? else puts end! end
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#        ^ meta.block.if.ruby
#         ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#             ^ meta.block.if.ruby
#              ^^^^ meta.block.if.ruby support.function.kernel.ruby
#                  ^ meta.block.if.ruby
#                   ^^^ meta.block.if.ruby variable.other.ruby
#                      ^^ meta.block.if.ruby
#                        ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                            ^ meta.block.if.ruby
#                             ^^^^ meta.block.if.ruby support.function.kernel.ruby
#                                 ^ meta.block.if.ruby
#                                  ^^^ meta.block.if.ruby variable.other.ruby
#                                     ^^ meta.block.if.ruby
#                                       ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  [if true then 1 else 2 end]
# ^ punctuation.section.array.begin.ruby
#  ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#    ^ meta.block.if.ruby
#     ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#         ^ meta.block.if.ruby
#          ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#              ^ meta.block.if.ruby
#               ^ meta.block.if.ruby constant.numeric.ruby
#                ^ meta.block.if.ruby
#                 ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                     ^ meta.block.if.ruby
#                      ^ meta.block.if.ruby constant.numeric.ruby
#                       ^ meta.block.if.ruby
#                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                           ^ punctuation.section.array.end.ruby
  [ if true then 1 else 2 end, if true then 2 else 3 end]
# ^ punctuation.section.array.begin.ruby
#  ^ meta.block.if.ruby
#   ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#     ^ meta.block.if.ruby
#      ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#          ^ meta.block.if.ruby
#           ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#               ^ meta.block.if.ruby
#                ^ meta.block.if.ruby constant.numeric.ruby
#                 ^ meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                      ^ meta.block.if.ruby
#                       ^ meta.block.if.ruby constant.numeric.ruby
#                        ^ meta.block.if.ruby
#                         ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                            ^ punctuation.separator.object.ruby
#                             ^ meta.block.if.ruby
#                              ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                                ^ meta.block.if.ruby
#                                 ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                     ^ meta.block.if.ruby
#                                      ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                          ^ meta.block.if.ruby
#                                           ^ meta.block.if.ruby constant.numeric.ruby
#                                            ^ meta.block.if.ruby
#                                             ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                 ^ meta.block.if.ruby
#                                                  ^ meta.block.if.ruby constant.numeric.ruby
#                                                   ^ meta.block.if.ruby
#                                                    ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                                       ^ punctuation.section.array.end.ruby
  {if true then :foo else :bar end => 1}
# ^ punctuation.section.scope.begin.ruby
#  ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#    ^ meta.block.if.ruby
#     ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#         ^ meta.block.if.ruby
#          ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#              ^ meta.block.if.ruby
#               ^ meta.block.if.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                ^^^ meta.block.if.ruby constant.language.symbol.ruby
#                   ^ meta.block.if.ruby
#                    ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                        ^ meta.block.if.ruby
#                         ^ meta.block.if.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                          ^^^ meta.block.if.ruby constant.language.symbol.ruby
#                             ^ meta.block.if.ruby
#                              ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                  ^^ punctuation.separator.key-value
#                                     ^ constant.numeric.ruby
#                                      ^ punctuation.section.scope.end.ruby
  { if true then :foo else :bar end => 1 }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.block.if.ruby
#   ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#     ^ meta.block.if.ruby
#      ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#          ^ meta.block.if.ruby
#           ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#               ^ meta.block.if.ruby
#                ^ meta.block.if.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                 ^^^ meta.block.if.ruby constant.language.symbol.ruby
#                    ^ meta.block.if.ruby
#                     ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                         ^ meta.block.if.ruby
#                          ^ meta.block.if.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                           ^^^ meta.block.if.ruby constant.language.symbol.ruby
#                              ^ meta.block.if.ruby
#                               ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                   ^^ punctuation.separator.key-value
#                                      ^ constant.numeric.ruby
#                                        ^ punctuation.section.scope.end.ruby
  {foo: if true then 1 else 2 end}
# ^ punctuation.section.scope.begin.ruby
#  ^^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#      ^ meta.block.if.ruby
#       ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#         ^ meta.block.if.ruby
#          ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#              ^ meta.block.if.ruby
#               ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                   ^ meta.block.if.ruby
#                    ^ meta.block.if.ruby constant.numeric.ruby
#                     ^ meta.block.if.ruby
#                      ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                          ^ meta.block.if.ruby
#                           ^ meta.block.if.ruby constant.numeric.ruby
#                            ^ meta.block.if.ruby
#                             ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                ^ punctuation.section.scope.end.ruby
  { foo: if true then 1 else 2 end, bar: if true then 2 else 3 end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^ meta.block.if.ruby
#        ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#          ^ meta.block.if.ruby
#           ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#               ^ meta.block.if.ruby
#                ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                    ^ meta.block.if.ruby
#                     ^ meta.block.if.ruby constant.numeric.ruby
#                      ^ meta.block.if.ruby
#                       ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                           ^ meta.block.if.ruby
#                            ^ meta.block.if.ruby constant.numeric.ruby
#                             ^ meta.block.if.ruby
#                              ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                 ^ punctuation.separator.object.ruby
#                                   ^^^ constant.language.symbol.hashkey.ruby
#                                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                       ^ meta.block.if.ruby
#                                        ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                                          ^ meta.block.if.ruby
#                                           ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                               ^ meta.block.if.ruby
#                                                ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                                    ^ meta.block.if.ruby
#                                                     ^ meta.block.if.ruby constant.numeric.ruby
#                                                      ^ meta.block.if.ruby
#                                                       ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                           ^ meta.block.if.ruby
#                                                            ^ meta.block.if.ruby constant.numeric.ruby
#                                                             ^ meta.block.if.ruby
#                                                              ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                                                  ^ punctuation.section.scope.end.ruby
  {:foo => if true then 1 else 2 end}
# ^ punctuation.section.scope.begin.ruby
#  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#   ^^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#         ^ meta.block.if.ruby
#          ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#            ^ meta.block.if.ruby
#             ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                 ^ meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                      ^ meta.block.if.ruby
#                       ^ meta.block.if.ruby constant.numeric.ruby
#                        ^ meta.block.if.ruby
#                         ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                             ^ meta.block.if.ruby
#                              ^ meta.block.if.ruby constant.numeric.ruby
#                               ^ meta.block.if.ruby
#                                ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                   ^ punctuation.section.scope.end.ruby
  { :foo => if true then 1 else 2 end, :bar=>if true then 2 else 3 end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#          ^ meta.block.if.ruby
#           ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#             ^ meta.block.if.ruby
#              ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                  ^ meta.block.if.ruby
#                   ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                       ^ meta.block.if.ruby
#                        ^ meta.block.if.ruby constant.numeric.ruby
#                         ^ meta.block.if.ruby
#                          ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                              ^ meta.block.if.ruby
#                               ^ meta.block.if.ruby constant.numeric.ruby
#                                ^ meta.block.if.ruby
#                                 ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                    ^ punctuation.separator.object.ruby
#                                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#                                       ^^^ constant.language.symbol.hashkey.ruby
#                                          ^^ punctuation.separator.key-value
#                                            ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                                              ^ meta.block.if.ruby
#                                               ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                   ^ meta.block.if.ruby
#                                                    ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                                        ^ meta.block.if.ruby
#                                                         ^ meta.block.if.ruby constant.numeric.ruby
#                                                          ^ meta.block.if.ruby
#                                                           ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                               ^ meta.block.if.ruby
#                                                                ^ meta.block.if.ruby constant.numeric.ruby
#                                                                 ^ meta.block.if.ruby
#                                                                  ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                                                                      ^ punctuation.section.scope.end.ruby
  (if true then 1 else 2 end)
# ^ punctuation.section.function.ruby
#  ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#    ^ meta.block.if.ruby
#     ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#         ^ meta.block.if.ruby
#          ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#              ^ meta.block.if.ruby
#               ^ meta.block.if.ruby constant.numeric.ruby
#                ^ meta.block.if.ruby
#                 ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                     ^ meta.block.if.ruby
#                      ^ meta.block.if.ruby constant.numeric.ruby
#                       ^ meta.block.if.ruby
#                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                           ^ punctuation.section.function.ruby
  ( if true then 1 else 2 end )
# ^ punctuation.section.function.ruby
#  ^ meta.block.if.ruby
#   ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#     ^ meta.block.if.ruby
#      ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#          ^ meta.block.if.ruby
#           ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#               ^ meta.block.if.ruby
#                ^ meta.block.if.ruby constant.numeric.ruby
#                 ^ meta.block.if.ruby
#                  ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                      ^ meta.block.if.ruby
#                       ^ meta.block.if.ruby constant.numeric.ruby
#                        ^ meta.block.if.ruby
#                         ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
#                             ^ punctuation.section.function.ruby

  foo::if something                                                 # shouldn't work
# ^^^ variable.other.ruby
#    ^^ punctuation.separator.method.ruby
#      ^^ meta.function-call.ruby entity.name.function.ruby
#         ^^^^^^^^^ variable.other.ruby
#                                                                   ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                    ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  foo.if something                                                  # shouldn't work
# ^^^ variable.other.ruby
#    ^ punctuation.separator.method.ruby
#     ^^ meta.function-call.ruby entity.name.function.ruby
#        ^^^^^^^^^ variable.other.ruby
#                                                                   ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                    ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  if? something                                                     # shouldn't work
# ^^ variable.other.ruby
#     ^^^^^^^^^ variable.other.ruby
#                                                                   ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                    ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  if! something                                                     # shouldn't work
# ^^ variable.other.ruby
#     ^^^^^^^^^ variable.other.ruby
#                                                                   ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                    ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  foo! if true
# ^^^ variable.other.ruby
#      ^^ keyword.control.modifier.conditional.if.ruby
#         ^^^^ constant.language.boolean.ruby
  foo? if true
# ^^^ variable.other.ruby
#      ^^ keyword.control.modifier.conditional.if.ruby
#         ^^^^ constant.language.boolean.ruby
  return {} if something
# ^^^^^^ keyword.control.pseudo-method.ruby
#        ^ punctuation.section.scope.begin.ruby
#         ^ punctuation.section.scope.end.ruby
#           ^^ keyword.control.modifier.conditional.if.ruby
#              ^^^^^^^^^ variable.other.ruby
  return [] if something
# ^^^^^^ keyword.control.pseudo-method.ruby
#        ^ punctuation.section.array.begin.ruby
#         ^ punctuation.section.array.end.ruby
#           ^^ keyword.control.modifier.conditional.if.ruby
#              ^^^^^^^^^ variable.other.ruby
  (expression) if something
# ^ punctuation.section.function.ruby
#  ^^^^^^^^^^ variable.other.ruby
#            ^ punctuation.section.function.ruby
#              ^^ keyword.control.modifier.conditional.if.ruby
#                 ^^^^^^^^^ variable.other.ruby
  method_without_args if something
# ^^^^^^^^^^^^^^^^^^^ variable.other.ruby
#                     ^^ keyword.control.modifier.conditional.if.ruby
#                        ^^^^^^^^^ variable.other.ruby
  method(with, args) if something
# ^^^^^^ meta.function-call.ruby entity.name.function.ruby
#       ^ meta.function-call.ruby punctuation.section.function.ruby
#        ^^^^ meta.function-call.ruby variable.other.ruby
#            ^ meta.function-call.ruby punctuation.separator.object.ruby
#             ^ meta.function-call.ruby
#              ^^^^ meta.function-call.ruby variable.other.ruby
#                  ^ meta.function-call.ruby punctuation.section.function.ruby
#                    ^^ keyword.control.modifier.conditional.if.ruby
#                       ^^^^^^^^^ variable.other.ruby
  method with, args if somethign
# ^^^^^^ variable.other.ruby
#        ^^^^ variable.other.ruby
#            ^ punctuation.separator.object.ruby
#              ^^^^ variable.other.ruby
#                   ^^ keyword.control.modifier.conditional.if.ruby
#                      ^^^^^^^^^ variable.other.ruby
  a = /regexp/ if something
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#      ^^^^^^ string.regexp.interpolated.ruby
#            ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#              ^^ keyword.control.modifier.conditional.if.ruby
#                 ^^^^^^^^^ variable.other.ruby
  a = %r<hello> if something
# ^ variable.other.ruby
#   ^ keyword.operator.assignment.ruby
#     ^^^ string.regexp.interpolated.ruby punctuation.section.regexp.begin.ruby
#        ^^^^^ string.regexp.interpolated.ruby
#             ^ string.regexp.interpolated.ruby punctuation.section.regexp.end.ruby
#              ^ string.regexp.interpolated.ruby
#               ^^ string.regexp.interpolated.ruby keyword.control.modifier.conditional.if.ruby
#                  ^^^^^^^^^ variable.other.ruby
  "hello".scan /[eo]/ if something
# ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#  ^^^^^ string.quoted.double.interpolated.ruby
#       ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#        ^ punctuation.separator.method.ruby
#         ^^^^ meta.function-call.ruby entity.name.function.ruby
#              ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#               ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                ^^ string.regexp.interpolated.ruby string.regexp.character-class.ruby
#                  ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                   ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#                     ^^ keyword.control.modifier.conditional.if.ruby
#                        ^^^^^^^^^ variable.other.ruby
  `ls` if true
# ^ string.interpolated.ruby punctuation.definition.string.begin.ruby
#  ^^ string.interpolated.ruby
#    ^ string.interpolated.ruby punctuation.definition.string.end.ruby
#      ^^ keyword.control.modifier.conditional.if.ruby
#         ^^^^ constant.language.boolean.ruby

  %w(hello, world, foo).map { |e| e.scan /[oeiua]/ } * if true; 2 else 0 end
# ^^^ string.quoted.other.ruby punctuation.section.array.begin.ruby
#    ^^^^^^^^^^^^^^^^^ string.quoted.other.ruby
#                     ^ string.quoted.other.ruby punctuation.section.array.end.ruby
#                      ^ punctuation.separator.method.ruby
#                       ^^^ meta.function-call.ruby entity.name.function.ruby
#                           ^ punctuation.section.scope.begin.ruby
#                            ^ meta.syntax.ruby.start-block
#                             ^ meta.block.parameters.ruby punctuation.separator.variable.ruby
#                              ^ meta.block.parameters.ruby variable.other.block.ruby
#                               ^ meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                 ^ variable.other.ruby
#                                  ^ punctuation.separator.method.ruby
#                                   ^^^^ meta.function-call.ruby entity.name.function.ruby
#                                        ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#                                         ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                                          ^^^^^ string.regexp.interpolated.ruby string.regexp.character-class.ruby
#                                               ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                                                ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#                                                  ^ punctuation.section.scope.end.ruby
#                                                    ^ keyword.operator.arithmetic.ruby
#                                                     ^ meta.block.if.ruby
#                                                      ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                                                        ^ meta.block.if.ruby
#                                                         ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                             ^ meta.block.if.ruby punctuation.separator.statement.ruby
#                                                              ^ meta.block.if.ruby
#                                                               ^ meta.block.if.ruby constant.numeric.ruby
#                                                                ^ meta.block.if.ruby
#                                                                 ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                                     ^ meta.block.if.ruby
#                                                                      ^ meta.block.if.ruby constant.numeric.ruby
#                                                                       ^ meta.block.if.ruby
#                                                                        ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  %w(hello, world, foo).map { |e| e.scan /[oeiua]/ if true } * if true then 2 else 0 end
# ^^^ string.quoted.other.ruby punctuation.section.array.begin.ruby
#    ^^^^^^^^^^^^^^^^^ string.quoted.other.ruby
#                     ^ string.quoted.other.ruby punctuation.section.array.end.ruby
#                      ^ punctuation.separator.method.ruby
#                       ^^^ meta.function-call.ruby entity.name.function.ruby
#                           ^ punctuation.section.scope.begin.ruby
#                            ^ meta.syntax.ruby.start-block
#                             ^ meta.block.parameters.ruby punctuation.separator.variable.ruby
#                              ^ meta.block.parameters.ruby variable.other.block.ruby
#                               ^ meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                 ^ variable.other.ruby
#                                  ^ punctuation.separator.method.ruby
#                                   ^^^^ meta.function-call.ruby entity.name.function.ruby
#                                        ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#                                         ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                                          ^^^^^ string.regexp.interpolated.ruby string.regexp.character-class.ruby
#                                               ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                                                ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#                                                  ^^ keyword.control.modifier.conditional.if.ruby
#                                                     ^^^^ constant.language.boolean.ruby
#                                                          ^ punctuation.section.scope.end.ruby
#                                                            ^ keyword.operator.arithmetic.ruby
#                                                             ^ meta.block.if.ruby
#                                                              ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                                                                ^ meta.block.if.ruby
#                                                                 ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                                                     ^ meta.block.if.ruby
#                                                                      ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                                                          ^ meta.block.if.ruby
#                                                                           ^ meta.block.if.ruby constant.numeric.ruby
#                                                                            ^ meta.block.if.ruby
#                                                                             ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                                                                 ^ meta.block.if.ruby
#                                                                                  ^ meta.block.if.ruby constant.numeric.ruby
#                                                                                   ^ meta.block.if.ruby
#                                                                                    ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  e.scan /[oeiua]/ if true; if true then 2 else 0 end
# ^ variable.other.ruby
#  ^ punctuation.separator.method.ruby
#   ^^^^ meta.function-call.ruby entity.name.function.ruby
#        ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#         ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#          ^^^^^ string.regexp.interpolated.ruby string.regexp.character-class.ruby
#               ^ string.regexp.interpolated.ruby string.regexp.character-class.ruby punctuation.definition.character-class.ruby
#                ^ string.regexp.interpolated.ruby punctuation.section.regexp.ruby
#                  ^^ keyword.control.modifier.conditional.if.ruby
#                     ^^^^ constant.language.boolean.ruby
#                         ^ punctuation.separator.statement.ruby
#                          ^ meta.block.if.ruby
#                           ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#                             ^ meta.block.if.ruby
#                              ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                                  ^ meta.block.if.ruby
#                                   ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
#                                       ^ meta.block.if.ruby
#                                        ^ meta.block.if.ruby constant.numeric.ruby
#                                         ^ meta.block.if.ruby
#                                          ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                                              ^ meta.block.if.ruby
#                                               ^ meta.block.if.ruby constant.numeric.ruby
#                                                ^ meta.block.if.ruby
#                                                 ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby

  if something then
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^^^^^^ meta.block.if.ruby variable.other.ruby
#             ^ meta.block.if.ruby
#              ^^^^ meta.block.if.ruby keyword.control.conditional.then.ruby
    if true
#^^^ meta.block.if.ruby meta.block.if.ruby
#   ^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#     ^ meta.block.if.ruby meta.block.if.ruby
#      ^^^^ meta.block.if.ruby meta.block.if.ruby constant.language.boolean.ruby
      foo
#^^^^^ meta.block.if.ruby meta.block.if.ruby
#     ^^^ meta.block.if.ruby meta.block.if.ruby variable.other.ruby
    else
#^^^ meta.block.if.ruby meta.block.if.ruby
#   ^^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
      bar
#^^^^^ meta.block.if.ruby meta.block.if.ruby
#     ^^^ meta.block.if.ruby meta.block.if.ruby variable.other.ruby
    end
#^^^ meta.block.if.ruby meta.block.if.ruby
#   ^^^ meta.block.if.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  else
#^ meta.block.if.ruby
# ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
    baz
#^^^ meta.block.if.ruby
#   ^^^ meta.block.if.ruby variable.other.ruby
  end
#^ meta.block.if.ruby
# ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby

  if true 
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#        ^^ meta.block.if.ruby
    puts (1..10).end
#^^^ meta.block.if.ruby
#   ^^^^ meta.block.if.ruby support.function.kernel.ruby
#       ^ meta.block.if.ruby
#        ^ meta.block.if.ruby punctuation.section.function.ruby
#         ^ meta.block.if.ruby constant.numeric.ruby
#          ^ meta.block.if.ruby punctuation.separator.method.ruby
#           ^ meta.block.if.ruby punctuation.separator.method.ruby
#            ^^ meta.block.if.ruby constant.numeric.ruby
#              ^ meta.block.if.ruby punctuation.section.function.ruby
#               ^ meta.block.if.ruby punctuation.separator.method.ruby
#                ^^^ meta.block.if.ruby meta.function-call.ruby entity.name.function.ruby
  else
#^ meta.block.if.ruby
# ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
    puts (1..20).end
#^^^ meta.block.if.ruby
#   ^^^^ meta.block.if.ruby support.function.kernel.ruby
#       ^ meta.block.if.ruby
#        ^ meta.block.if.ruby punctuation.section.function.ruby
#         ^ meta.block.if.ruby constant.numeric.ruby
#          ^ meta.block.if.ruby punctuation.separator.method.ruby
#           ^ meta.block.if.ruby punctuation.separator.method.ruby
#            ^^ meta.block.if.ruby constant.numeric.ruby
#              ^ meta.block.if.ruby punctuation.section.function.ruby
#               ^ meta.block.if.ruby punctuation.separator.method.ruby
#                ^^^ meta.block.if.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.block.if.ruby
# ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby

  if true
#^ meta.block.if.ruby
# ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#   ^ meta.block.if.ruby
#    ^^^^ meta.block.if.ruby constant.language.boolean.ruby
    puts end?
#^^^ meta.block.if.ruby
#   ^^^^ meta.block.if.ruby support.function.kernel.ruby
#       ^ meta.block.if.ruby
#        ^^^ meta.block.if.ruby variable.other.ruby
#           ^^ meta.block.if.ruby
  else
#^ meta.block.if.ruby
# ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
    puts end!
#^^^ meta.block.if.ruby
#   ^^^^ meta.block.if.ruby support.function.kernel.ruby
#       ^ meta.block.if.ruby
#        ^^^ meta.block.if.ruby variable.other.ruby
#           ^^ meta.block.if.ruby
  end
#^ meta.block.if.ruby
# ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    1
#^^^ meta.block.begin.ruby
#   ^ meta.block.begin.ruby constant.numeric.ruby
  end; if true; true else false end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
#    ^ punctuation.separator.statement.ruby
#     ^ meta.block.if.ruby
#      ^^ meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#        ^ meta.block.if.ruby
#         ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#             ^ meta.block.if.ruby punctuation.separator.statement.ruby
#              ^ meta.block.if.ruby
#               ^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                   ^ meta.block.if.ruby
#                    ^^^^ meta.block.if.ruby keyword.control.conditional.else.ruby
#                        ^ meta.block.if.ruby
#                         ^^^^^ meta.block.if.ruby constant.language.boolean.ruby
#                              ^ meta.block.if.ruby
#                               ^^^ meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    1
#^^^ meta.block.begin.ruby
#   ^ meta.block.begin.ruby constant.numeric.ruby
  end if true
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby
#     ^^ keyword.control.modifier.conditional.if.ruby
#        ^^^^ constant.language.boolean.ruby

  case 15 when 0..50 then "foo" when 51..100 then "bar" else "baz" end
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
#        ^ meta.block.case.ruby
#         ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#             ^ meta.block.case.ruby
#              ^ meta.block.case.ruby constant.numeric.ruby
#               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^^ meta.block.case.ruby constant.numeric.ruby
#                   ^ meta.block.case.ruby
#                    ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                        ^ meta.block.case.ruby
#                         ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                          ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#                             ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                              ^ meta.block.case.ruby
#                               ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                   ^ meta.block.case.ruby
#                                    ^^ meta.block.case.ruby constant.numeric.ruby
#                                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                        ^^^ meta.block.case.ruby constant.numeric.ruby
#                                           ^ meta.block.case.ruby
#                                            ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                ^ meta.block.case.ruby
#                                                 ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                  ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#                                                     ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                      ^ meta.block.case.ruby
#                                                       ^^^^ meta.block.case.ruby keyword.control.conditional.else.ruby
#                                                           ^ meta.block.case.ruby
#                                                            ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                             ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#                                                                ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                 ^ meta.block.case.ruby
#                                                                  ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  case x = rand(1..100) when 0..50 then case x when 0..25 then 1 else 2 end when 51..100 then case x when 51..75 then 3 else 4 end end
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby variable.other.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby keyword.operator.assignment.ruby
#         ^ meta.block.case.ruby
#          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby constant.numeric.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                      ^ meta.block.case.ruby
#                       ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                           ^ meta.block.case.ruby
#                            ^ meta.block.case.ruby constant.numeric.ruby
#                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                               ^^ meta.block.case.ruby constant.numeric.ruby
#                                 ^ meta.block.case.ruby
#                                  ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                      ^ meta.block.case.ruby
#                                       ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#                                           ^ meta.block.case.ruby meta.block.case.ruby
#                                            ^ meta.block.case.ruby meta.block.case.ruby variable.other.ruby
#                                             ^ meta.block.case.ruby meta.block.case.ruby
#                                              ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                  ^ meta.block.case.ruby meta.block.case.ruby
#                                                   ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                    ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#                                                     ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#                                                      ^^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                        ^ meta.block.case.ruby meta.block.case.ruby
#                                                         ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                             ^ meta.block.case.ruby meta.block.case.ruby
#                                                              ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                               ^ meta.block.case.ruby meta.block.case.ruby
#                                                                ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.else.ruby
#                                                                    ^ meta.block.case.ruby meta.block.case.ruby
#                                                                     ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                                      ^ meta.block.case.ruby meta.block.case.ruby
#                                                                       ^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                          ^ meta.block.case.ruby
#                                                                           ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                               ^ meta.block.case.ruby
#                                                                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                    ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                       ^ meta.block.case.ruby
#                                                                                        ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                            ^ meta.block.case.ruby
#                                                                                             ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#                                                                                                 ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                  ^ meta.block.case.ruby meta.block.case.ruby variable.other.ruby
#                                                                                                   ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                    ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                        ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                         ^^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                                                                           ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                            ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                             ^^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                                                                               ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                                ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                    ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                                     ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                                                                                      ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                                       ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.else.ruby
#                                                                                                                           ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                                            ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#                                                                                                                             ^ meta.block.case.ruby meta.block.case.ruby
#                                                                                                                              ^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                                                                 ^ meta.block.case.ruby
#                                                                                                                                  ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  1..case 15 when 0..50 then 10 when 51..100 then 20 else 30 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#        ^ meta.block.case.ruby
#         ^^ meta.block.case.ruby constant.numeric.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                ^ meta.block.case.ruby
#                 ^ meta.block.case.ruby constant.numeric.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                    ^^ meta.block.case.ruby constant.numeric.ruby
#                      ^ meta.block.case.ruby
#                       ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                           ^ meta.block.case.ruby
#                            ^^ meta.block.case.ruby constant.numeric.ruby
#                              ^ meta.block.case.ruby
#                               ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                   ^ meta.block.case.ruby
#                                    ^^ meta.block.case.ruby constant.numeric.ruby
#                                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                        ^^^ meta.block.case.ruby constant.numeric.ruby
#                                           ^ meta.block.case.ruby
#                                            ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                ^ meta.block.case.ruby
#                                                 ^^ meta.block.case.ruby constant.numeric.ruby
#                                                   ^ meta.block.case.ruby
#                                                    ^^^^ meta.block.case.ruby keyword.control.conditional.else.ruby
#                                                        ^ meta.block.case.ruby
#                                                         ^^ meta.block.case.ruby constant.numeric.ruby
#                                                           ^ meta.block.case.ruby
#                                                            ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  1...case 15 when 0..50 then 10 when 51..100 then 20 else 30 end
# ^ constant.numeric.ruby
#  ^ punctuation.separator.method.ruby
#   ^ punctuation.separator.method.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#         ^ meta.block.case.ruby
#          ^^ meta.block.case.ruby constant.numeric.ruby
#            ^ meta.block.case.ruby
#             ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                 ^ meta.block.case.ruby
#                  ^ meta.block.case.ruby constant.numeric.ruby
#                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                     ^^ meta.block.case.ruby constant.numeric.ruby
#                       ^ meta.block.case.ruby
#                        ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                            ^ meta.block.case.ruby
#                             ^^ meta.block.case.ruby constant.numeric.ruby
#                               ^ meta.block.case.ruby
#                                ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                    ^ meta.block.case.ruby
#                                     ^^ meta.block.case.ruby constant.numeric.ruby
#                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                         ^^^ meta.block.case.ruby constant.numeric.ruby
#                                            ^ meta.block.case.ruby
#                                             ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                 ^ meta.block.case.ruby
#                                                  ^^ meta.block.case.ruby constant.numeric.ruby
#                                                    ^ meta.block.case.ruby
#                                                     ^^^^ meta.block.case.ruby keyword.control.conditional.else.ruby
#                                                         ^ meta.block.case.ruby
#                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                            ^ meta.block.case.ruby
#                                                             ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  case x = rand(1..100) when 0..50 then puts (1..10).end when 51..100 then puts (1..20).end end
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby variable.other.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby keyword.operator.assignment.ruby
#         ^ meta.block.case.ruby
#          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby constant.numeric.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                      ^ meta.block.case.ruby
#                       ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                           ^ meta.block.case.ruby
#                            ^ meta.block.case.ruby constant.numeric.ruby
#                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                               ^^ meta.block.case.ruby constant.numeric.ruby
#                                 ^ meta.block.case.ruby
#                                  ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                      ^ meta.block.case.ruby
#                                       ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                           ^ meta.block.case.ruby
#                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                             ^ meta.block.case.ruby constant.numeric.ruby
#                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                                  ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                    ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                       ^ meta.block.case.ruby
#                                                        ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                            ^ meta.block.case.ruby
#                                                             ^^ meta.block.case.ruby constant.numeric.ruby
#                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                 ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                    ^ meta.block.case.ruby
#                                                                     ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                         ^ meta.block.case.ruby
#                                                                          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                                                              ^ meta.block.case.ruby
#                                                                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                   ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                       ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                          ^ meta.block.case.ruby
#                                                                                           ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  case x = rand(1..100) when 0..50 then puts end? when 51..100 then puts end! end
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby variable.other.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby keyword.operator.assignment.ruby
#         ^ meta.block.case.ruby
#          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby constant.numeric.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                      ^ meta.block.case.ruby
#                       ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                           ^ meta.block.case.ruby
#                            ^ meta.block.case.ruby constant.numeric.ruby
#                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                               ^^ meta.block.case.ruby constant.numeric.ruby
#                                 ^ meta.block.case.ruby
#                                  ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                      ^ meta.block.case.ruby
#                                       ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                           ^ meta.block.case.ruby
#                                            ^^^ meta.block.case.ruby variable.other.ruby
#                                               ^^ meta.block.case.ruby
#                                                 ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                     ^ meta.block.case.ruby
#                                                      ^^ meta.block.case.ruby constant.numeric.ruby
#                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                          ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                             ^ meta.block.case.ruby
#                                                              ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                  ^ meta.block.case.ruby
#                                                                   ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                                                       ^ meta.block.case.ruby
#                                                                        ^^^ meta.block.case.ruby variable.other.ruby
#                                                                           ^^ meta.block.case.ruby
#                                                                             ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  [case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end]
# ^ punctuation.section.array.begin.ruby
#  ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#      ^ meta.block.case.ruby
#       ^ meta.block.case.ruby variable.other.ruby
#        ^ meta.block.case.ruby
#         ^ meta.block.case.ruby keyword.operator.assignment.ruby
#          ^ meta.block.case.ruby
#           ^^^^ meta.block.case.ruby support.function.kernel.ruby
#               ^ meta.block.case.ruby punctuation.section.function.ruby
#                ^ meta.block.case.ruby constant.numeric.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^^^ meta.block.case.ruby constant.numeric.ruby
#                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                       ^ meta.block.case.ruby
#                        ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                            ^ meta.block.case.ruby
#                             ^ meta.block.case.ruby constant.numeric.ruby
#                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                  ^ meta.block.case.ruby
#                                   ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                       ^ meta.block.case.ruby
#                                        ^ meta.block.case.ruby punctuation.section.function.ruby
#                                         ^ meta.block.case.ruby constant.numeric.ruby
#                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                            ^^ meta.block.case.ruby constant.numeric.ruby
#                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                   ^ meta.block.case.ruby
#                                                    ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                        ^ meta.block.case.ruby
#                                                         ^^ meta.block.case.ruby constant.numeric.ruby
#                                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                             ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                ^ meta.block.case.ruby
#                                                                 ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                     ^ meta.block.case.ruby
#                                                                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                       ^ meta.block.case.ruby constant.numeric.ruby
#                                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                              ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                 ^ meta.block.case.ruby
#                                                                                  ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                     ^ punctuation.section.array.end.ruby
  [ case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end, case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end]
# ^ punctuation.section.array.begin.ruby
#   ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby variable.other.ruby
#         ^ meta.block.case.ruby
#          ^ meta.block.case.ruby keyword.operator.assignment.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                ^ meta.block.case.ruby punctuation.section.function.ruby
#                 ^ meta.block.case.ruby constant.numeric.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                    ^^^ meta.block.case.ruby constant.numeric.ruby
#                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                        ^ meta.block.case.ruby
#                         ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                             ^ meta.block.case.ruby
#                              ^ meta.block.case.ruby constant.numeric.ruby
#                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                 ^^ meta.block.case.ruby constant.numeric.ruby
#                                   ^ meta.block.case.ruby
#                                    ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                        ^ meta.block.case.ruby
#                                         ^ meta.block.case.ruby punctuation.section.function.ruby
#                                          ^ meta.block.case.ruby constant.numeric.ruby
#                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                             ^^ meta.block.case.ruby constant.numeric.ruby
#                                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                 ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                    ^ meta.block.case.ruby
#                                                     ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                         ^ meta.block.case.ruby
#                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                              ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                 ^ meta.block.case.ruby
#                                                                  ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                      ^ meta.block.case.ruby
#                                                                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                        ^ meta.block.case.ruby constant.numeric.ruby
#                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                           ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                             ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                               ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                  ^ meta.block.case.ruby
#                                                                                   ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                      ^ punctuation.separator.object.ruby
#                                                                                        ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#                                                                                            ^ meta.block.case.ruby
#                                                                                             ^ meta.block.case.ruby variable.other.ruby
#                                                                                              ^ meta.block.case.ruby
#                                                                                               ^ meta.block.case.ruby keyword.operator.assignment.ruby
#                                                                                                ^ meta.block.case.ruby
#                                                                                                 ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                                                                                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                      ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                         ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                             ^ meta.block.case.ruby
#                                                                                                              ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                                  ^ meta.block.case.ruby
#                                                                                                                   ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                      ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                        ^ meta.block.case.ruby
#                                                                                                                         ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                             ^ meta.block.case.ruby
#                                                                                                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                               ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                  ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                    ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                      ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                                                                         ^ meta.block.case.ruby
#                                                                                                                                          ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                                                              ^ meta.block.case.ruby
#                                                                                                                                               ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                   ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                      ^ meta.block.case.ruby
#                                                                                                                                                       ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                                                           ^ meta.block.case.ruby
#                                                                                                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                             ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                  ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                    ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                                                                                                       ^ meta.block.case.ruby
#                                                                                                                                                                        ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                                                                                                           ^ punctuation.section.array.end.ruby
  {case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end => 1}
# ^ punctuation.section.scope.begin.ruby
#  ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#      ^ meta.block.case.ruby
#       ^ meta.block.case.ruby variable.other.ruby
#        ^ meta.block.case.ruby
#         ^ meta.block.case.ruby keyword.operator.assignment.ruby
#          ^ meta.block.case.ruby
#           ^^^^ meta.block.case.ruby support.function.kernel.ruby
#               ^ meta.block.case.ruby punctuation.section.function.ruby
#                ^ meta.block.case.ruby constant.numeric.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^^^ meta.block.case.ruby constant.numeric.ruby
#                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                       ^ meta.block.case.ruby
#                        ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                            ^ meta.block.case.ruby
#                             ^ meta.block.case.ruby constant.numeric.ruby
#                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                  ^ meta.block.case.ruby
#                                   ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                       ^ meta.block.case.ruby
#                                        ^ meta.block.case.ruby punctuation.section.function.ruby
#                                         ^ meta.block.case.ruby constant.numeric.ruby
#                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                            ^^ meta.block.case.ruby constant.numeric.ruby
#                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                   ^ meta.block.case.ruby
#                                                    ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                        ^ meta.block.case.ruby
#                                                         ^^ meta.block.case.ruby constant.numeric.ruby
#                                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                             ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                ^ meta.block.case.ruby
#                                                                 ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                     ^ meta.block.case.ruby
#                                                                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                       ^ meta.block.case.ruby constant.numeric.ruby
#                                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                              ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                 ^ meta.block.case.ruby
#                                                                                  ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                      ^^ punctuation.separator.key-value
#                                                                                         ^ constant.numeric.ruby
#                                                                                          ^ punctuation.section.scope.end.ruby
  { case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end => 1 }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby variable.other.ruby
#         ^ meta.block.case.ruby
#          ^ meta.block.case.ruby keyword.operator.assignment.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                ^ meta.block.case.ruby punctuation.section.function.ruby
#                 ^ meta.block.case.ruby constant.numeric.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                    ^^^ meta.block.case.ruby constant.numeric.ruby
#                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                        ^ meta.block.case.ruby
#                         ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                             ^ meta.block.case.ruby
#                              ^ meta.block.case.ruby constant.numeric.ruby
#                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                 ^^ meta.block.case.ruby constant.numeric.ruby
#                                   ^ meta.block.case.ruby
#                                    ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                        ^ meta.block.case.ruby
#                                         ^ meta.block.case.ruby punctuation.section.function.ruby
#                                          ^ meta.block.case.ruby constant.numeric.ruby
#                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                             ^^ meta.block.case.ruby constant.numeric.ruby
#                                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                 ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                    ^ meta.block.case.ruby
#                                                     ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                         ^ meta.block.case.ruby
#                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                              ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                 ^ meta.block.case.ruby
#                                                                  ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                      ^ meta.block.case.ruby
#                                                                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                        ^ meta.block.case.ruby constant.numeric.ruby
#                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                           ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                             ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                               ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                  ^ meta.block.case.ruby
#                                                                                   ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                       ^^ punctuation.separator.key-value
#                                                                                          ^ constant.numeric.ruby
#                                                                                            ^ punctuation.section.scope.end.ruby
  {foo: case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end}
# ^ punctuation.section.scope.begin.ruby
#  ^^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#           ^ meta.block.case.ruby
#            ^ meta.block.case.ruby variable.other.ruby
#             ^ meta.block.case.ruby
#              ^ meta.block.case.ruby keyword.operator.assignment.ruby
#               ^ meta.block.case.ruby
#                ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                    ^ meta.block.case.ruby punctuation.section.function.ruby
#                     ^ meta.block.case.ruby constant.numeric.ruby
#                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                        ^^^ meta.block.case.ruby constant.numeric.ruby
#                           ^ meta.block.case.ruby punctuation.section.function.ruby
#                            ^ meta.block.case.ruby
#                             ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                 ^ meta.block.case.ruby
#                                  ^ meta.block.case.ruby constant.numeric.ruby
#                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                     ^^ meta.block.case.ruby constant.numeric.ruby
#                                       ^ meta.block.case.ruby
#                                        ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                            ^ meta.block.case.ruby
#                                             ^ meta.block.case.ruby punctuation.section.function.ruby
#                                              ^ meta.block.case.ruby constant.numeric.ruby
#                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                 ^^ meta.block.case.ruby constant.numeric.ruby
#                                                   ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                     ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                        ^ meta.block.case.ruby
#                                                         ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                             ^ meta.block.case.ruby
#                                                              ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                     ^ meta.block.case.ruby
#                                                                      ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                          ^ meta.block.case.ruby
#                                                                           ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                            ^ meta.block.case.ruby constant.numeric.ruby
#                                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                               ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                 ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                   ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                      ^ meta.block.case.ruby
#                                                                                       ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                          ^ punctuation.section.scope.end.ruby
  { foo: case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end, bar: case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#        ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#            ^ meta.block.case.ruby
#             ^ meta.block.case.ruby variable.other.ruby
#              ^ meta.block.case.ruby
#               ^ meta.block.case.ruby keyword.operator.assignment.ruby
#                ^ meta.block.case.ruby
#                 ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                      ^ meta.block.case.ruby constant.numeric.ruby
#                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                         ^^^ meta.block.case.ruby constant.numeric.ruby
#                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                             ^ meta.block.case.ruby
#                              ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                  ^ meta.block.case.ruby
#                                   ^ meta.block.case.ruby constant.numeric.ruby
#                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                      ^^ meta.block.case.ruby constant.numeric.ruby
#                                        ^ meta.block.case.ruby
#                                         ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                             ^ meta.block.case.ruby
#                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                               ^ meta.block.case.ruby constant.numeric.ruby
#                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                  ^^ meta.block.case.ruby constant.numeric.ruby
#                                                    ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                      ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                         ^ meta.block.case.ruby
#                                                          ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                              ^ meta.block.case.ruby
#                                                               ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                   ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                      ^ meta.block.case.ruby
#                                                                       ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                           ^ meta.block.case.ruby
#                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                             ^ meta.block.case.ruby constant.numeric.ruby
#                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                  ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                    ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                       ^ meta.block.case.ruby
#                                                                                        ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                           ^ punctuation.separator.object.ruby
#                                                                                             ^^^ constant.language.symbol.hashkey.ruby
#                                                                                                ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                  ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#                                                                                                      ^ meta.block.case.ruby
#                                                                                                       ^ meta.block.case.ruby variable.other.ruby
#                                                                                                        ^ meta.block.case.ruby
#                                                                                                         ^ meta.block.case.ruby keyword.operator.assignment.ruby
#                                                                                                          ^ meta.block.case.ruby
#                                                                                                           ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                                                                                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                   ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                       ^ meta.block.case.ruby
#                                                                                                                        ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                                            ^ meta.block.case.ruby
#                                                                                                                             ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                  ^ meta.block.case.ruby
#                                                                                                                                   ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                                       ^ meta.block.case.ruby
#                                                                                                                                        ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                         ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                            ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                                                                                   ^ meta.block.case.ruby
#                                                                                                                                                    ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                                                                        ^ meta.block.case.ruby
#                                                                                                                                                         ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                             ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                ^ meta.block.case.ruby
#                                                                                                                                                                 ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                                                                     ^ meta.block.case.ruby
#                                                                                                                                                                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                                       ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                              ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                                                                                                                 ^ meta.block.case.ruby
#                                                                                                                                                                                  ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                                                                                                                      ^ punctuation.section.scope.end.ruby
  {:foo => case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end}
# ^ punctuation.section.scope.begin.ruby
#  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#   ^^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#          ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#              ^ meta.block.case.ruby
#               ^ meta.block.case.ruby variable.other.ruby
#                ^ meta.block.case.ruby
#                 ^ meta.block.case.ruby keyword.operator.assignment.ruby
#                  ^ meta.block.case.ruby
#                   ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                        ^ meta.block.case.ruby constant.numeric.ruby
#                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                           ^^^ meta.block.case.ruby constant.numeric.ruby
#                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                               ^ meta.block.case.ruby
#                                ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                    ^ meta.block.case.ruby
#                                     ^ meta.block.case.ruby constant.numeric.ruby
#                                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                        ^^ meta.block.case.ruby constant.numeric.ruby
#                                          ^ meta.block.case.ruby
#                                           ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                               ^ meta.block.case.ruby
#                                                ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                 ^ meta.block.case.ruby constant.numeric.ruby
#                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                    ^^ meta.block.case.ruby constant.numeric.ruby
#                                                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                        ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                           ^ meta.block.case.ruby
#                                                            ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                ^ meta.block.case.ruby
#                                                                 ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                     ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                        ^ meta.block.case.ruby
#                                                                         ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                             ^ meta.block.case.ruby
#                                                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                               ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                  ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                    ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                      ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                         ^ meta.block.case.ruby
#                                                                                          ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                             ^ punctuation.section.scope.end.ruby
  { :foo => case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end, :bar=>case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#           ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#               ^ meta.block.case.ruby
#                ^ meta.block.case.ruby variable.other.ruby
#                 ^ meta.block.case.ruby
#                  ^ meta.block.case.ruby keyword.operator.assignment.ruby
#                   ^ meta.block.case.ruby
#                    ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                        ^ meta.block.case.ruby punctuation.section.function.ruby
#                         ^ meta.block.case.ruby constant.numeric.ruby
#                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                            ^^^ meta.block.case.ruby constant.numeric.ruby
#                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                ^ meta.block.case.ruby
#                                 ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                     ^ meta.block.case.ruby
#                                      ^ meta.block.case.ruby constant.numeric.ruby
#                                       ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                         ^^ meta.block.case.ruby constant.numeric.ruby
#                                           ^ meta.block.case.ruby
#                                            ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                ^ meta.block.case.ruby
#                                                 ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                  ^ meta.block.case.ruby constant.numeric.ruby
#                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                     ^^ meta.block.case.ruby constant.numeric.ruby
#                                                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                         ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                            ^ meta.block.case.ruby
#                                                             ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                 ^ meta.block.case.ruby
#                                                                  ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                    ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                      ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                         ^ meta.block.case.ruby
#                                                                          ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                              ^ meta.block.case.ruby
#                                                                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                   ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                     ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                       ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                          ^ meta.block.case.ruby
#                                                                                           ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                              ^ punctuation.separator.object.ruby
#                                                                                                ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#                                                                                                 ^^^ constant.language.symbol.hashkey.ruby
#                                                                                                    ^^ punctuation.separator.key-value
#                                                                                                      ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#                                                                                                          ^ meta.block.case.ruby
#                                                                                                           ^ meta.block.case.ruby variable.other.ruby
#                                                                                                            ^ meta.block.case.ruby
#                                                                                                             ^ meta.block.case.ruby keyword.operator.assignment.ruby
#                                                                                                              ^ meta.block.case.ruby
#                                                                                                               ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                                                                                                                   ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                    ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                     ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                      ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                       ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                          ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                           ^ meta.block.case.ruby
#                                                                                                                            ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                                                ^ meta.block.case.ruby
#                                                                                                                                 ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                    ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                      ^ meta.block.case.ruby
#                                                                                                                                       ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                                           ^ meta.block.case.ruby
#                                                                                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                             ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                  ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                    ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                                                                                       ^ meta.block.case.ruby
#                                                                                                                                                        ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                                                                                                                            ^ meta.block.case.ruby
#                                                                                                                                                             ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                 ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                    ^ meta.block.case.ruby
#                                                                                                                                                                     ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                                                                                                                         ^ meta.block.case.ruby
#                                                                                                                                                                          ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                                           ^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                              ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                                                                                                                                ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                                                                                                                                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                                                                                                                                  ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                                                                                                                     ^ meta.block.case.ruby
#                                                                                                                                                                                      ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                                                                                                                          ^ punctuation.section.scope.end.ruby
  (case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end)
# ^ punctuation.section.function.ruby
#  ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#      ^ meta.block.case.ruby
#       ^ meta.block.case.ruby variable.other.ruby
#        ^ meta.block.case.ruby
#         ^ meta.block.case.ruby keyword.operator.assignment.ruby
#          ^ meta.block.case.ruby
#           ^^^^ meta.block.case.ruby support.function.kernel.ruby
#               ^ meta.block.case.ruby punctuation.section.function.ruby
#                ^ meta.block.case.ruby constant.numeric.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^^^ meta.block.case.ruby constant.numeric.ruby
#                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                       ^ meta.block.case.ruby
#                        ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                            ^ meta.block.case.ruby
#                             ^ meta.block.case.ruby constant.numeric.ruby
#                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                ^^ meta.block.case.ruby constant.numeric.ruby
#                                  ^ meta.block.case.ruby
#                                   ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                       ^ meta.block.case.ruby
#                                        ^ meta.block.case.ruby punctuation.section.function.ruby
#                                         ^ meta.block.case.ruby constant.numeric.ruby
#                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                            ^^ meta.block.case.ruby constant.numeric.ruby
#                                              ^ meta.block.case.ruby punctuation.section.function.ruby
#                                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                   ^ meta.block.case.ruby
#                                                    ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                        ^ meta.block.case.ruby
#                                                         ^^ meta.block.case.ruby constant.numeric.ruby
#                                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                             ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                ^ meta.block.case.ruby
#                                                                 ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                     ^ meta.block.case.ruby
#                                                                      ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                       ^ meta.block.case.ruby constant.numeric.ruby
#                                                                        ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                            ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                              ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                 ^ meta.block.case.ruby
#                                                                                  ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                     ^ punctuation.section.function.ruby
  ( case x = rand(1..100) when 0..50 then (1..10).end when 51..100 then (1..20).end end )
# ^ punctuation.section.function.ruby
#   ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby variable.other.ruby
#         ^ meta.block.case.ruby
#          ^ meta.block.case.ruby keyword.operator.assignment.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby support.function.kernel.ruby
#                ^ meta.block.case.ruby punctuation.section.function.ruby
#                 ^ meta.block.case.ruby constant.numeric.ruby
#                  ^ meta.block.case.ruby punctuation.separator.method.ruby
#                   ^ meta.block.case.ruby punctuation.separator.method.ruby
#                    ^^^ meta.block.case.ruby constant.numeric.ruby
#                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                        ^ meta.block.case.ruby
#                         ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                             ^ meta.block.case.ruby
#                              ^ meta.block.case.ruby constant.numeric.ruby
#                               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                 ^^ meta.block.case.ruby constant.numeric.ruby
#                                   ^ meta.block.case.ruby
#                                    ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                        ^ meta.block.case.ruby
#                                         ^ meta.block.case.ruby punctuation.section.function.ruby
#                                          ^ meta.block.case.ruby constant.numeric.ruby
#                                           ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                             ^^ meta.block.case.ruby constant.numeric.ruby
#                                               ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                 ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                    ^ meta.block.case.ruby
#                                                     ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#                                                         ^ meta.block.case.ruby
#                                                          ^^ meta.block.case.ruby constant.numeric.ruby
#                                                            ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                             ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                              ^^^ meta.block.case.ruby constant.numeric.ruby
#                                                                 ^ meta.block.case.ruby
#                                                                  ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
#                                                                      ^ meta.block.case.ruby
#                                                                       ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                        ^ meta.block.case.ruby constant.numeric.ruby
#                                                                         ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                          ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                           ^^ meta.block.case.ruby constant.numeric.ruby
#                                                                             ^ meta.block.case.ruby punctuation.section.function.ruby
#                                                                              ^ meta.block.case.ruby punctuation.separator.method.ruby
#                                                                               ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
#                                                                                  ^ meta.block.case.ruby
#                                                                                   ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
#                                                                                       ^ punctuation.section.function.ruby

  self.case 15 when 0..50 then "foo" when 51..100 then "bar" else "baz" end          # shouldn't work
# ^^^^ variable.language.self.ruby
#     ^ punctuation.separator.method.ruby
#      ^^^^ meta.function-call.ruby entity.name.function.ruby
#           ^^ constant.numeric.ruby
#              ^^^^ keyword.control.conditional.when.ruby
#                   ^ constant.numeric.ruby
#                    ^ punctuation.separator.method.ruby
#                     ^ punctuation.separator.method.ruby
#                      ^^ constant.numeric.ruby
#                         ^^^^ keyword.control.conditional.then.ruby
#                              ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                               ^^^ string.quoted.double.interpolated.ruby
#                                  ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                    ^^^^ keyword.control.conditional.when.ruby
#                                         ^^ constant.numeric.ruby
#                                           ^ punctuation.separator.method.ruby
#                                            ^ punctuation.separator.method.ruby
#                                             ^^^ constant.numeric.ruby
#                                                 ^^^^ keyword.control.conditional.then.ruby
#                                                      ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                       ^^^ string.quoted.double.interpolated.ruby
#                                                          ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                            ^^^^ keyword.control.conditional.else.ruby
#                                                                 ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                                  ^^^ string.quoted.double.interpolated.ruby
#                                                                     ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                       ^^^ keyword.control.end.ruby
#                                                                                    ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                     ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  self::case 15 when 0..50 then "foo" when 51..100 then "bar" else "baz" end         # shouldn't work
# ^^^^ variable.language.self.ruby
#     ^^ punctuation.separator.method.ruby
#       ^^^^ meta.function-call.ruby entity.name.function.ruby
#            ^^ constant.numeric.ruby
#               ^^^^ keyword.control.conditional.when.ruby
#                    ^ constant.numeric.ruby
#                     ^ punctuation.separator.method.ruby
#                      ^ punctuation.separator.method.ruby
#                       ^^ constant.numeric.ruby
#                          ^^^^ keyword.control.conditional.then.ruby
#                               ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                ^^^ string.quoted.double.interpolated.ruby
#                                   ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                     ^^^^ keyword.control.conditional.when.ruby
#                                          ^^ constant.numeric.ruby
#                                            ^ punctuation.separator.method.ruby
#                                             ^ punctuation.separator.method.ruby
#                                              ^^^ constant.numeric.ruby
#                                                  ^^^^ keyword.control.conditional.then.ruby
#                                                       ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                        ^^^ string.quoted.double.interpolated.ruby
#                                                           ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                             ^^^^ keyword.control.conditional.else.ruby
#                                                                  ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                                   ^^^ string.quoted.double.interpolated.ruby
#                                                                      ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                        ^^^ keyword.control.end.ruby
#                                                                                    ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                     ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  case? 15 when 0..50 then "foo" when 51..100 then "bar" else "baz" end              # shouldn't work
# ^^^^ variable.other.ruby
#       ^^ constant.numeric.ruby
#          ^^^^ keyword.control.conditional.when.ruby
#               ^ constant.numeric.ruby
#                ^ punctuation.separator.method.ruby
#                 ^ punctuation.separator.method.ruby
#                  ^^ constant.numeric.ruby
#                     ^^^^ keyword.control.conditional.then.ruby
#                          ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                           ^^^ string.quoted.double.interpolated.ruby
#                              ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                ^^^^ keyword.control.conditional.when.ruby
#                                     ^^ constant.numeric.ruby
#                                       ^ punctuation.separator.method.ruby
#                                        ^ punctuation.separator.method.ruby
#                                         ^^^ constant.numeric.ruby
#                                             ^^^^ keyword.control.conditional.then.ruby
#                                                  ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                   ^^^ string.quoted.double.interpolated.ruby
#                                                      ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                        ^^^^ keyword.control.conditional.else.ruby
#                                                             ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                              ^^^ string.quoted.double.interpolated.ruby
#                                                                 ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                   ^^^ keyword.control.end.ruby
#                                                                                    ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                     ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  case! 15 when 0..50 then "foo" when 51..100 then "bar" else "baz" end              # shouldn't work
# ^^^^ variable.other.ruby
#       ^^ constant.numeric.ruby
#          ^^^^ keyword.control.conditional.when.ruby
#               ^ constant.numeric.ruby
#                ^ punctuation.separator.method.ruby
#                 ^ punctuation.separator.method.ruby
#                  ^^ constant.numeric.ruby
#                     ^^^^ keyword.control.conditional.then.ruby
#                          ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                           ^^^ string.quoted.double.interpolated.ruby
#                              ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                ^^^^ keyword.control.conditional.when.ruby
#                                     ^^ constant.numeric.ruby
#                                       ^ punctuation.separator.method.ruby
#                                        ^ punctuation.separator.method.ruby
#                                         ^^^ constant.numeric.ruby
#                                             ^^^^ keyword.control.conditional.then.ruby
#                                                  ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                   ^^^ string.quoted.double.interpolated.ruby
#                                                      ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                        ^^^^ keyword.control.conditional.else.ruby
#                                                             ^ string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                              ^^^ string.quoted.double.interpolated.ruby
#                                                                 ^ string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                   ^^^ keyword.control.end.ruby
#                                                                                    ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                     ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby

  case 15
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
  when 0..50
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby constant.numeric.ruby
#       ^ meta.block.case.ruby punctuation.separator.method.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^^ meta.block.case.ruby constant.numeric.ruby
    "foo"
#^^^ meta.block.case.ruby
#   ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#    ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#       ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  when 51..100
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^ meta.block.case.ruby punctuation.separator.method.ruby
#          ^^^ meta.block.case.ruby constant.numeric.ruby
    "bar"
#^^^ meta.block.case.ruby
#   ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#    ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#       ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  else
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.else.ruby
    "baz"
#^^^ meta.block.case.ruby
#   ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#    ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#       ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  end
#^ meta.block.case.ruby
# ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby

  case x = rand(1..100)
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby variable.other.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby keyword.operator.assignment.ruby
#         ^ meta.block.case.ruby
#          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby constant.numeric.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
  when 0..50 then
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby constant.numeric.ruby
#       ^ meta.block.case.ruby punctuation.separator.method.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^^ meta.block.case.ruby constant.numeric.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
    puts (1..10).end
#^^^ meta.block.case.ruby
#   ^^^^ meta.block.case.ruby support.function.kernel.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby punctuation.section.function.ruby
#         ^ meta.block.case.ruby constant.numeric.ruby
#          ^ meta.block.case.ruby punctuation.separator.method.ruby
#           ^ meta.block.case.ruby punctuation.separator.method.ruby
#            ^^ meta.block.case.ruby constant.numeric.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
  when 51..100 then
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^ meta.block.case.ruby punctuation.separator.method.ruby
#          ^^^ meta.block.case.ruby constant.numeric.ruby
#             ^ meta.block.case.ruby
#              ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
    puts (1..20).end
#^^^ meta.block.case.ruby
#   ^^^^ meta.block.case.ruby support.function.kernel.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby punctuation.section.function.ruby
#         ^ meta.block.case.ruby constant.numeric.ruby
#          ^ meta.block.case.ruby punctuation.separator.method.ruby
#           ^ meta.block.case.ruby punctuation.separator.method.ruby
#            ^^ meta.block.case.ruby constant.numeric.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby punctuation.separator.method.ruby
#                ^^^ meta.block.case.ruby meta.function-call.ruby entity.name.function.ruby
  end
#^ meta.block.case.ruby
# ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby

  case x = rand(1..100)
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby variable.other.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby keyword.operator.assignment.ruby
#         ^ meta.block.case.ruby
#          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby constant.numeric.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
  when 0..50 then
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby constant.numeric.ruby
#       ^ meta.block.case.ruby punctuation.separator.method.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^^ meta.block.case.ruby constant.numeric.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
    puts end?
#^^^ meta.block.case.ruby
#   ^^^^ meta.block.case.ruby support.function.kernel.ruby
#       ^ meta.block.case.ruby
#        ^^^ meta.block.case.ruby variable.other.ruby
#           ^^ meta.block.case.ruby
  when 51..100 then
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^ meta.block.case.ruby punctuation.separator.method.ruby
#          ^^^ meta.block.case.ruby constant.numeric.ruby
#             ^ meta.block.case.ruby
#              ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
    puts end!
#^^^ meta.block.case.ruby
#   ^^^^ meta.block.case.ruby support.function.kernel.ruby
#       ^ meta.block.case.ruby
#        ^^^ meta.block.case.ruby variable.other.ruby
#           ^^ meta.block.case.ruby
  end
#^ meta.block.case.ruby
# ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby


  case if [true, false].sample then 25 else 75 end
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby meta.block.if.ruby
#      ^^ meta.block.case.ruby meta.block.if.ruby keyword.control.conditional.if.begin.ruby
#        ^ meta.block.case.ruby meta.block.if.ruby
#         ^ meta.block.case.ruby meta.block.if.ruby punctuation.section.array.begin.ruby
#          ^^^^ meta.block.case.ruby meta.block.if.ruby constant.language.boolean.ruby
#              ^ meta.block.case.ruby meta.block.if.ruby punctuation.separator.object.ruby
#               ^ meta.block.case.ruby meta.block.if.ruby
#                ^^^^^ meta.block.case.ruby meta.block.if.ruby constant.language.boolean.ruby
#                     ^ meta.block.case.ruby meta.block.if.ruby punctuation.section.array.end.ruby
#                      ^ meta.block.case.ruby meta.block.if.ruby punctuation.separator.method.ruby
#                       ^^^^^^ meta.block.case.ruby meta.block.if.ruby meta.function-call.ruby entity.name.function.ruby
#                             ^ meta.block.case.ruby meta.block.if.ruby
#                              ^^^^ meta.block.case.ruby meta.block.if.ruby keyword.control.conditional.then.ruby
#                                  ^ meta.block.case.ruby meta.block.if.ruby
#                                   ^^ meta.block.case.ruby meta.block.if.ruby constant.numeric.ruby
#                                     ^ meta.block.case.ruby meta.block.if.ruby
#                                      ^^^^ meta.block.case.ruby meta.block.if.ruby keyword.control.conditional.else.ruby
#                                          ^ meta.block.case.ruby meta.block.if.ruby
#                                           ^^ meta.block.case.ruby meta.block.if.ruby constant.numeric.ruby
#                                             ^ meta.block.case.ruby meta.block.if.ruby
#                                              ^^^ meta.block.case.ruby meta.block.if.ruby keyword.control.end.ruby keyword.control.conditional.if.end.ruby
  when 0..50
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby constant.numeric.ruby
#       ^ meta.block.case.ruby punctuation.separator.method.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^^ meta.block.case.ruby constant.numeric.ruby
    "foo"
#^^^ meta.block.case.ruby
#   ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#    ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#       ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  when 51..100
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^ meta.block.case.ruby punctuation.separator.method.ruby
#          ^^^ meta.block.case.ruby constant.numeric.ruby
    "bar"
#^^^ meta.block.case.ruby
#   ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#    ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#       ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  else
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.else.ruby
    "baz"
#^^^ meta.block.case.ruby
#   ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#    ^^^ meta.block.case.ruby string.quoted.double.interpolated.ruby
#       ^ meta.block.case.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
  end
#^ meta.block.case.ruby
# ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby

  case x = rand(1..100)
# ^^^^ meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby variable.other.ruby
#       ^ meta.block.case.ruby
#        ^ meta.block.case.ruby keyword.operator.assignment.ruby
#         ^ meta.block.case.ruby
#          ^^^^ meta.block.case.ruby support.function.kernel.ruby
#              ^ meta.block.case.ruby punctuation.section.function.ruby
#               ^ meta.block.case.ruby constant.numeric.ruby
#                ^ meta.block.case.ruby punctuation.separator.method.ruby
#                 ^ meta.block.case.ruby punctuation.separator.method.ruby
#                  ^^^ meta.block.case.ruby constant.numeric.ruby
#                     ^ meta.block.case.ruby punctuation.section.function.ruby
  when 0..50 then
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^ meta.block.case.ruby constant.numeric.ruby
#       ^ meta.block.case.ruby punctuation.separator.method.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^^ meta.block.case.ruby constant.numeric.ruby
#           ^ meta.block.case.ruby
#            ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
    case x
#^^^ meta.block.case.ruby
#   ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#       ^ meta.block.case.ruby meta.block.case.ruby
#        ^ meta.block.case.ruby meta.block.case.ruby variable.other.ruby
    when 0..25 then
#^^^ meta.block.case.ruby meta.block.case.ruby
#   ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.when.ruby
#       ^ meta.block.case.ruby meta.block.case.ruby
#        ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#         ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#          ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#           ^^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#             ^ meta.block.case.ruby meta.block.case.ruby
#              ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.then.ruby
      1
#^^^^^ meta.block.case.ruby meta.block.case.ruby
#     ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
    else
#^^^ meta.block.case.ruby meta.block.case.ruby
#   ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.else.ruby
      2
#^^^^^ meta.block.case.ruby meta.block.case.ruby
#     ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
    end
#^^^ meta.block.case.ruby meta.block.case.ruby
#   ^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  when 51..100 then
#^ meta.block.case.ruby
# ^^^^ meta.block.case.ruby keyword.control.conditional.when.ruby
#     ^ meta.block.case.ruby
#      ^^ meta.block.case.ruby constant.numeric.ruby
#        ^ meta.block.case.ruby punctuation.separator.method.ruby
#         ^ meta.block.case.ruby punctuation.separator.method.ruby
#          ^^^ meta.block.case.ruby constant.numeric.ruby
#             ^ meta.block.case.ruby
#              ^^^^ meta.block.case.ruby keyword.control.conditional.then.ruby
    case x
#^^^ meta.block.case.ruby
#   ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.case.begin.ruby
#       ^ meta.block.case.ruby meta.block.case.ruby
#        ^ meta.block.case.ruby meta.block.case.ruby variable.other.ruby
    when 51..75 then
#^^^ meta.block.case.ruby meta.block.case.ruby
#   ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.when.ruby
#       ^ meta.block.case.ruby meta.block.case.ruby
#        ^^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#          ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#           ^ meta.block.case.ruby meta.block.case.ruby punctuation.separator.method.ruby
#            ^^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
#              ^ meta.block.case.ruby meta.block.case.ruby
#               ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.then.ruby
      3
#^^^^^ meta.block.case.ruby meta.block.case.ruby
#     ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
    else
#^^^ meta.block.case.ruby meta.block.case.ruby
#   ^^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.conditional.else.ruby
      4
#^^^^^ meta.block.case.ruby meta.block.case.ruby
#     ^ meta.block.case.ruby meta.block.case.ruby constant.numeric.ruby
    end
#^^^ meta.block.case.ruby meta.block.case.ruby
#   ^^^ meta.block.case.ruby meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby
  end
#^ meta.block.case.ruby
# ^^^ meta.block.case.ruby keyword.control.end.ruby keyword.control.conditional.case.end.ruby

  some_method rescue handle_error
# ^^^^^^^^^^^ variable.other.ruby
#             ^^^^^^ keyword.control.rescue.ruby
#                    ^^^^^^^^^^^^ variable.other.ruby
  some_method rescue SomeException
# ^^^^^^^^^^^ variable.other.ruby
#             ^^^^^^ keyword.control.rescue.ruby
#                    ^^^^^^^^^^^^^ variable.other.constant.ruby

  self.rescue handle_error                            # shouldn't work
# ^^^^ variable.language.self.ruby
#     ^ punctuation.separator.method.ruby
#      ^^^^^^ meta.function-call.ruby entity.name.function.ruby
#             ^^^^^^^^^^^^ variable.other.ruby
#                                                     ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                      ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  self::rescue handle_error                           # shouldn't work
# ^^^^ variable.language.self.ruby
#     ^^ punctuation.separator.method.ruby
#       ^^^^^^ meta.function-call.ruby entity.name.function.ruby
#              ^^^^^^^^^^^^ variable.other.ruby
#                                                     ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                      ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  some_method rescue? handle_error                    # shouldn't work
# ^^^^^^^^^^^ variable.other.ruby
#             ^^^^^^ variable.other.ruby
#                     ^^^^^^^^^^^^ variable.other.ruby
#                                                     ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                      ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby
  some_method rescue! SomeException                   # shouldn't work
# ^^^^^^^^^^^ variable.other.ruby
#             ^^^^^^ variable.other.ruby
#                     ^^^^^^^^^^^^^ variable.other.constant.ruby
#                                                     ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                      ^^^^^^^^^^^^^^^ comment.line.number-sign.ruby

  # multiline
#^ punctuation.whitespace.comment.leading.ruby
# ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#  ^^^^^^^^^^ comment.line.number-sign.ruby
  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    some_method
#^^^ meta.block.begin.ruby
#   ^^^^^^^^^^^ meta.block.begin.ruby variable.other.ruby
  rescue
#^ meta.block.begin.ruby
# ^^^^^^ meta.block.begin.ruby keyword.control.rescue.ruby
    handle_error
#^^^ meta.block.begin.ruby
#   ^^^^^^^^^^^^ meta.block.begin.ruby variable.other.ruby
  ensure
#^ meta.block.begin.ruby
# ^^^^^^ meta.block.begin.ruby keyword.control.ensure.ruby
    close_connection
#^^^ meta.block.begin.ruby
#   ^^^^^^^^^^^^^^^^ meta.block.begin.ruby variable.other.ruby
  end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  begin
# ^^^^^ meta.block.begin.ruby keyword.control.begin.begin.ruby
    some_method
#^^^ meta.block.begin.ruby
#   ^^^^^^^^^^^ meta.block.begin.ruby variable.other.ruby
  rescue SomeException
#^ meta.block.begin.ruby
# ^^^^^^ meta.block.begin.ruby keyword.control.rescue.ruby
#       ^ meta.block.begin.ruby
#        ^^^^^^^^^^^^^ meta.block.begin.ruby variable.other.constant.ruby
    handle_error
#^^^ meta.block.begin.ruby
#   ^^^^^^^^^^^^ meta.block.begin.ruby variable.other.ruby
  ensure
#^ meta.block.begin.ruby
# ^^^^^^ meta.block.begin.ruby keyword.control.ensure.ruby
    close_connection
#^^^ meta.block.begin.ruby
#   ^^^^^^^^^^^^^^^^ meta.block.begin.ruby variable.other.ruby
  end
#^ meta.block.begin.ruby
# ^^^ meta.block.begin.ruby keyword.control.end.ruby keyword.control.begin.end.ruby

  def method1
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    some_method
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  rescue
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby keyword.control.rescue.ruby
    handle_error
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  ensure
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby keyword.control.ensure.ruby
    close_connection
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method2
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    some_method
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  rescue SomeException => e
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby keyword.control.rescue.ruby
#       ^ meta.function.method.without-arguments.ruby
#        ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.constant.ruby
#                     ^ meta.function.method.without-arguments.ruby
#                      ^^ meta.function.method.without-arguments.ruby punctuation.separator.key-value
#                        ^ meta.function.method.without-arguments.ruby
#                         ^ meta.function.method.without-arguments.ruby variable.other.ruby
    log(e)
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function-call.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
    handle_error
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  ensure
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby keyword.control.ensure.ruby
    close_connection
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method3
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    some_method
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  rescue? SomeException => e                        # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#       ^^ meta.function.method.without-arguments.ruby
#         ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.constant.ruby
#                      ^ meta.function.method.without-arguments.ruby
#                       ^^ meta.function.method.without-arguments.ruby punctuation.separator.key-value
#                         ^ meta.function.method.without-arguments.ruby
#                          ^ meta.function.method.without-arguments.ruby variable.other.ruby
#                           ^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                   ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                    ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    log(e)
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function-call.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
    handle_error
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  ensure?                                           # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                   ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                    ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    close_connection
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method4
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    some_method
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  rescue! SomeException => e                        # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#       ^^ meta.function.method.without-arguments.ruby
#         ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.constant.ruby
#                      ^ meta.function.method.without-arguments.ruby
#                       ^^ meta.function.method.without-arguments.ruby punctuation.separator.key-value
#                         ^ meta.function.method.without-arguments.ruby
#                          ^ meta.function.method.without-arguments.ruby variable.other.ruby
#                           ^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                   ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                    ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    log(e)
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function-call.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
    handle_error
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  ensure!                                           # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                   ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                    ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    close_connection
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method5
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    some_method
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  .rescue SomeException => e                        # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^ meta.function.method.without-arguments.ruby punctuation.separator.method.ruby
#  ^^^^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#        ^ meta.function.method.without-arguments.ruby
#         ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.constant.ruby
#                      ^ meta.function.method.without-arguments.ruby
#                       ^^ meta.function.method.without-arguments.ruby punctuation.separator.key-value
#                         ^ meta.function.method.without-arguments.ruby
#                          ^ meta.function.method.without-arguments.ruby variable.other.ruby
#                           ^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                   ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                    ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    log(e)
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function-call.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
    handle_error
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  .ensure                                           # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^ meta.function.method.without-arguments.ruby punctuation.separator.method.ruby
#  ^^^^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                   ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                    ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    close_connection
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  def method6
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#    ^ meta.function.method.without-arguments.ruby
#     ^^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
    some_method
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  ::rescue SomeException => e                        # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^^ meta.function.method.without-arguments.ruby punctuation.separator.method.ruby
#   ^^^^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#         ^ meta.function.method.without-arguments.ruby
#          ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.constant.ruby
#                       ^ meta.function.method.without-arguments.ruby
#                        ^^ meta.function.method.without-arguments.ruby punctuation.separator.key-value
#                          ^ meta.function.method.without-arguments.ruby
#                           ^ meta.function.method.without-arguments.ruby variable.other.ruby
#                            ^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                    ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                     ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    log(e)
#^^^ meta.function.method.without-arguments.ruby
#   ^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#      ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
#       ^ meta.function.method.without-arguments.ruby meta.function-call.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby meta.function-call.ruby punctuation.section.function.ruby
    handle_error
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  ::ensure                                           # shouldn't work
#^ meta.function.method.without-arguments.ruby
# ^^ meta.function.method.without-arguments.ruby punctuation.separator.method.ruby
#   ^^^^^^ meta.function.method.without-arguments.ruby meta.function-call.ruby entity.name.function.ruby
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby
#                                                    ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                     ^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    close_connection
#^^^ meta.function.method.without-arguments.ruby
#   ^^^^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
  end
#^ meta.function.method.without-arguments.ruby
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

  {
# ^ punctuation.section.scope.begin.ruby
    class: 1,
#   ^^^^^ constant.language.symbol.hashkey.ruby
#        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    module: 1,
#   ^^^^^^ constant.language.symbol.hashkey.ruby
#         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    if: 1,
#   ^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^ constant.numeric.ruby
#        ^ punctuation.separator.object.ruby
    unless: 1,
#   ^^^^^^ constant.language.symbol.hashkey.ruby
#         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    while: 1,
#   ^^^^^ constant.language.symbol.hashkey.ruby
#        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    until: 1,
#   ^^^^^ constant.language.symbol.hashkey.ruby
#        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    end: 1,
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#        ^ constant.numeric.ruby
#         ^ punctuation.separator.object.ruby
    for: 1,
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#        ^ constant.numeric.ruby
#         ^ punctuation.separator.object.ruby
    begin: 1,
#   ^^^^^ constant.language.symbol.hashkey.ruby
#        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    or: 1,
#   ^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^ constant.numeric.ruby
#        ^ punctuation.separator.object.ruby
    not: 1,
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#        ^ constant.numeric.ruby
#         ^ punctuation.separator.object.ruby
    in: 1,
#   ^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^ constant.numeric.ruby
#        ^ punctuation.separator.object.ruby
    when: 1,
#   ^^^^ constant.language.symbol.hashkey.ruby
#       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#         ^ constant.numeric.ruby
#          ^ punctuation.separator.object.ruby
    then: 1,
#   ^^^^ constant.language.symbol.hashkey.ruby
#       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#         ^ constant.numeric.ruby
#          ^ punctuation.separator.object.ruby
    case: 1,
#   ^^^^ constant.language.symbol.hashkey.ruby
#       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#         ^ constant.numeric.ruby
#          ^ punctuation.separator.object.ruby
    else: 1,
#   ^^^^ constant.language.symbol.hashkey.ruby
#       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#         ^ constant.numeric.ruby
#          ^ punctuation.separator.object.ruby
    do: 1,
#   ^^ constant.language.symbol.hashkey.ruby
#     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#       ^ constant.numeric.ruby
#        ^ punctuation.separator.object.ruby
    rescue: 1,
#   ^^^^^^ constant.language.symbol.hashkey.ruby
#         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    ensure: 1,
#   ^^^^^^ constant.language.symbol.hashkey.ruby
#         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    elsif: 1,
#   ^^^^^ constant.language.symbol.hashkey.ruby
#        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    def: 1
#   ^^^ constant.language.symbol.hashkey.ruby
#      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#        ^ constant.numeric.ruby
  }
# ^ punctuation.section.scope.end.ruby

  {class: 1,module: 1,if: 1,unless: 1,while: 1,until: 1,end: 1,for: 1,begin: 1,or: 1,not: 1,in: 1,when: 1,then: 1,case: 1,else: 1,do: 1,rescue: 1,ensure: 1,elsif: 1,def: 1}
# ^ punctuation.section.scope.begin.ruby
#  ^^^^^ constant.language.symbol.hashkey.ruby
#       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#         ^ constant.numeric.ruby
#          ^ punctuation.separator.object.ruby
#           ^^^^^^ constant.language.symbol.hashkey.ruby
#                 ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                   ^ constant.numeric.ruby
#                    ^ punctuation.separator.object.ruby
#                     ^^ constant.language.symbol.hashkey.ruby
#                       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                         ^ constant.numeric.ruby
#                          ^ punctuation.separator.object.ruby
#                           ^^^^^^ constant.language.symbol.hashkey.ruby
#                                 ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                   ^ constant.numeric.ruby
#                                    ^ punctuation.separator.object.ruby
#                                     ^^^^^ constant.language.symbol.hashkey.ruby
#                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                            ^ constant.numeric.ruby
#                                             ^ punctuation.separator.object.ruby
#                                              ^^^^^ constant.language.symbol.hashkey.ruby
#                                                   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                     ^ constant.numeric.ruby
#                                                      ^ punctuation.separator.object.ruby
#                                                       ^^^ constant.language.symbol.hashkey.ruby
#                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                            ^ constant.numeric.ruby
#                                                             ^ punctuation.separator.object.ruby
#                                                              ^^^ constant.language.symbol.hashkey.ruby
#                                                                 ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                   ^ constant.numeric.ruby
#                                                                    ^ punctuation.separator.object.ruby
#                                                                     ^^^^^ constant.language.symbol.hashkey.ruby
#                                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                            ^ constant.numeric.ruby
#                                                                             ^ punctuation.separator.object.ruby
#                                                                              ^^ constant.language.symbol.hashkey.ruby
#                                                                                ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                  ^ constant.numeric.ruby
#                                                                                   ^ punctuation.separator.object.ruby
#                                                                                    ^^^ constant.language.symbol.hashkey.ruby
#                                                                                       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                         ^ constant.numeric.ruby
#                                                                                          ^ punctuation.separator.object.ruby
#                                                                                           ^^ constant.language.symbol.hashkey.ruby
#                                                                                             ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                               ^ constant.numeric.ruby
#                                                                                                ^ punctuation.separator.object.ruby
#                                                                                                 ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                       ^ constant.numeric.ruby
#                                                                                                        ^ punctuation.separator.object.ruby
#                                                                                                         ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                             ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                               ^ constant.numeric.ruby
#                                                                                                                ^ punctuation.separator.object.ruby
#                                                                                                                 ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                       ^ constant.numeric.ruby
#                                                                                                                        ^ punctuation.separator.object.ruby
#                                                                                                                         ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                             ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                               ^ constant.numeric.ruby
#                                                                                                                                ^ punctuation.separator.object.ruby
#                                                                                                                                 ^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                     ^ constant.numeric.ruby
#                                                                                                                                      ^ punctuation.separator.object.ruby
#                                                                                                                                       ^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                             ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                               ^ constant.numeric.ruby
#                                                                                                                                                ^ punctuation.separator.object.ruby
#                                                                                                                                                 ^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                         ^ constant.numeric.ruby
#                                                                                                                                                          ^ punctuation.separator.object.ruby
#                                                                                                                                                           ^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                                ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                                  ^ constant.numeric.ruby
#                                                                                                                                                                   ^ punctuation.separator.object.ruby
#                                                                                                                                                                    ^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                                       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                                         ^ constant.numeric.ruby
#                                                                                                                                                                          ^ punctuation.section.scope.end.ruby
  { class: 1, module: 1, if: 1, unless: 1, while: 1, until: 1, end: 1, for: 1, begin: 1, or: 1, not: 1, in: 1, when: 1, then: 1, case: 1, else: 1, do: 1, rescue: 1, ensure: 1, elsif: 1, def: 1 }
# ^ punctuation.section.scope.begin.ruby
#  ^ meta.syntax.ruby.start-block
#   ^^^^^ constant.language.symbol.hashkey.ruby
#        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
#             ^^^^^^ constant.language.symbol.hashkey.ruby
#                   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                     ^ constant.numeric.ruby
#                      ^ punctuation.separator.object.ruby
#                        ^^ constant.language.symbol.hashkey.ruby
#                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                            ^ constant.numeric.ruby
#                             ^ punctuation.separator.object.ruby
#                               ^^^^^^ constant.language.symbol.hashkey.ruby
#                                     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                       ^ constant.numeric.ruby
#                                        ^ punctuation.separator.object.ruby
#                                          ^^^^^ constant.language.symbol.hashkey.ruby
#                                               ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                 ^ constant.numeric.ruby
#                                                  ^ punctuation.separator.object.ruby
#                                                    ^^^^^ constant.language.symbol.hashkey.ruby
#                                                         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                           ^ constant.numeric.ruby
#                                                            ^ punctuation.separator.object.ruby
#                                                              ^^^ constant.language.symbol.hashkey.ruby
#                                                                 ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                   ^ constant.numeric.ruby
#                                                                    ^ punctuation.separator.object.ruby
#                                                                      ^^^ constant.language.symbol.hashkey.ruby
#                                                                         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                           ^ constant.numeric.ruby
#                                                                            ^ punctuation.separator.object.ruby
#                                                                              ^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                     ^ constant.numeric.ruby
#                                                                                      ^ punctuation.separator.object.ruby
#                                                                                        ^^ constant.language.symbol.hashkey.ruby
#                                                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                            ^ constant.numeric.ruby
#                                                                                             ^ punctuation.separator.object.ruby
#                                                                                               ^^^ constant.language.symbol.hashkey.ruby
#                                                                                                  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                    ^ constant.numeric.ruby
#                                                                                                     ^ punctuation.separator.object.ruby
#                                                                                                       ^^ constant.language.symbol.hashkey.ruby
#                                                                                                         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                           ^ constant.numeric.ruby
#                                                                                                            ^ punctuation.separator.object.ruby
#                                                                                                              ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                    ^ constant.numeric.ruby
#                                                                                                                     ^ punctuation.separator.object.ruby
#                                                                                                                       ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                           ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                             ^ constant.numeric.ruby
#                                                                                                                              ^ punctuation.separator.object.ruby
#                                                                                                                                ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                      ^ constant.numeric.ruby
#                                                                                                                                       ^ punctuation.separator.object.ruby
#                                                                                                                                         ^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                             ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                               ^ constant.numeric.ruby
#                                                                                                                                                ^ punctuation.separator.object.ruby
#                                                                                                                                                  ^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                      ^ constant.numeric.ruby
#                                                                                                                                                       ^ punctuation.separator.object.ruby
#                                                                                                                                                         ^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                               ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                                 ^ constant.numeric.ruby
#                                                                                                                                                                  ^ punctuation.separator.object.ruby
#                                                                                                                                                                    ^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                                            ^ constant.numeric.ruby
#                                                                                                                                                                             ^ punctuation.separator.object.ruby
#                                                                                                                                                                               ^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                                                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                                                      ^ constant.numeric.ruby
#                                                                                                                                                                                       ^ punctuation.separator.object.ruby
#                                                                                                                                                                                         ^^^ constant.language.symbol.hashkey.ruby
#                                                                                                                                                                                            ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                                                                                                                              ^ constant.numeric.ruby
#                                                                                                                                                                                                ^ punctuation.section.scope.end.ruby

  {
# ^ punctuation.section.scope.begin.ruby
    :class => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.hashkey.ruby
#          ^^ punctuation.separator.key-value
#             ^ constant.numeric.ruby
#              ^ punctuation.separator.object.ruby
    :module => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.hashkey.ruby
#           ^^ punctuation.separator.key-value
#              ^ constant.numeric.ruby
#               ^ punctuation.separator.object.ruby
    :if => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    :unless => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.hashkey.ruby
#           ^^ punctuation.separator.key-value
#              ^ constant.numeric.ruby
#               ^ punctuation.separator.object.ruby
    :while => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.hashkey.ruby
#          ^^ punctuation.separator.key-value
#             ^ constant.numeric.ruby
#              ^ punctuation.separator.object.ruby
    :until => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.hashkey.ruby
#          ^^ punctuation.separator.key-value
#             ^ constant.numeric.ruby
#              ^ punctuation.separator.object.ruby
    :end => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    :for => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    :begin => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.hashkey.ruby
#          ^^ punctuation.separator.key-value
#             ^ constant.numeric.ruby
#              ^ punctuation.separator.object.ruby
    :or => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    :not => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
    :in => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    :when => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.hashkey.ruby
#         ^^ punctuation.separator.key-value
#            ^ constant.numeric.ruby
#             ^ punctuation.separator.object.ruby
    :then => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.hashkey.ruby
#         ^^ punctuation.separator.key-value
#            ^ constant.numeric.ruby
#             ^ punctuation.separator.object.ruby
    :case => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.hashkey.ruby
#         ^^ punctuation.separator.key-value
#            ^ constant.numeric.ruby
#             ^ punctuation.separator.object.ruby
    :else => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.hashkey.ruby
#         ^^ punctuation.separator.key-value
#            ^ constant.numeric.ruby
#             ^ punctuation.separator.object.ruby
    :do => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.hashkey.ruby
#       ^^ punctuation.separator.key-value
#          ^ constant.numeric.ruby
#           ^ punctuation.separator.object.ruby
    :rescue => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.hashkey.ruby
#           ^^ punctuation.separator.key-value
#              ^ constant.numeric.ruby
#               ^ punctuation.separator.object.ruby
    :ensure => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.hashkey.ruby
#           ^^ punctuation.separator.key-value
#              ^ constant.numeric.ruby
#               ^ punctuation.separator.object.ruby
    :elsif => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.hashkey.ruby
#          ^^ punctuation.separator.key-value
#             ^ constant.numeric.ruby
#              ^ punctuation.separator.object.ruby
    :def => 1,
#   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.hashkey.ruby
#        ^^ punctuation.separator.key-value
#           ^ constant.numeric.ruby
#            ^ punctuation.separator.object.ruby
  }
# ^ punctuation.section.scope.end.ruby

  [
# ^ punctuation.section.array.begin.ruby
    :class,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.ruby
#         ^ punctuation.separator.object.ruby
    :module,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.ruby
#          ^ punctuation.separator.object.ruby
    :if,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.ruby
#      ^ punctuation.separator.object.ruby
    :unless,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.ruby
#          ^ punctuation.separator.object.ruby
    :until,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.ruby
#         ^ punctuation.separator.object.ruby
    :end,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.ruby
#       ^ punctuation.separator.object.ruby
    :for,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.ruby
#       ^ punctuation.separator.object.ruby
    :begin,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.ruby
#         ^ punctuation.separator.object.ruby
    :or,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.ruby
#      ^ punctuation.separator.object.ruby
    :not,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.ruby
#       ^ punctuation.separator.object.ruby
    :in,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.ruby
#      ^ punctuation.separator.object.ruby
    :when,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.ruby
#        ^ punctuation.separator.object.ruby
    :then,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.ruby
#        ^ punctuation.separator.object.ruby
    :case,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.ruby
#        ^ punctuation.separator.object.ruby
    :else,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^ constant.language.symbol.ruby
#        ^ punctuation.separator.object.ruby
    :do,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^ constant.language.symbol.ruby
#      ^ punctuation.separator.object.ruby
    :rescue,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.ruby
#          ^ punctuation.separator.object.ruby
    :ensure,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^^ constant.language.symbol.ruby
#          ^ punctuation.separator.object.ruby
    :elsif,
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.ruby
#         ^ punctuation.separator.object.ruby
    :def
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^ constant.language.symbol.ruby
  ]
# ^ punctuation.section.array.end.ruby

  [:class,:module,:if,:unless,:until,:end,:for,:begin,:or,:not,:in,:when,:then,:case,:else,:do,:rescue,:ensure,:elsif,:def]
# ^ punctuation.section.array.begin.ruby
#  ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#   ^^^^^ constant.language.symbol.ruby
#        ^ punctuation.separator.object.ruby
#         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#          ^^^^^^ constant.language.symbol.ruby
#                ^ punctuation.separator.object.ruby
#                 ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                  ^^ constant.language.symbol.ruby
#                    ^ punctuation.separator.object.ruby
#                     ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                      ^^^^^^ constant.language.symbol.ruby
#                            ^ punctuation.separator.object.ruby
#                             ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                              ^^^^^ constant.language.symbol.ruby
#                                   ^ punctuation.separator.object.ruby
#                                    ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                     ^^^ constant.language.symbol.ruby
#                                        ^ punctuation.separator.object.ruby
#                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                          ^^^ constant.language.symbol.ruby
#                                             ^ punctuation.separator.object.ruby
#                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                               ^^^^^ constant.language.symbol.ruby
#                                                    ^ punctuation.separator.object.ruby
#                                                     ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                      ^^ constant.language.symbol.ruby
#                                                        ^ punctuation.separator.object.ruby
#                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                          ^^^ constant.language.symbol.ruby
#                                                             ^ punctuation.separator.object.ruby
#                                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                               ^^ constant.language.symbol.ruby
#                                                                 ^ punctuation.separator.object.ruby
#                                                                  ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                   ^^^^ constant.language.symbol.ruby
#                                                                       ^ punctuation.separator.object.ruby
#                                                                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                         ^^^^ constant.language.symbol.ruby
#                                                                             ^ punctuation.separator.object.ruby
#                                                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                               ^^^^ constant.language.symbol.ruby
#                                                                                   ^ punctuation.separator.object.ruby
#                                                                                    ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                     ^^^^ constant.language.symbol.ruby
#                                                                                         ^ punctuation.separator.object.ruby
#                                                                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                           ^^ constant.language.symbol.ruby
#                                                                                             ^ punctuation.separator.object.ruby
#                                                                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                               ^^^^^^ constant.language.symbol.ruby
#                                                                                                     ^ punctuation.separator.object.ruby
#                                                                                                      ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                       ^^^^^^ constant.language.symbol.ruby
#                                                                                                             ^ punctuation.separator.object.ruby
#                                                                                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                               ^^^^^ constant.language.symbol.ruby
#                                                                                                                    ^ punctuation.separator.object.ruby
#                                                                                                                     ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                                      ^^^ constant.language.symbol.ruby
#                                                                                                                         ^ punctuation.section.array.end.ruby
  [ :class, :module, :if, :unless, :until, :end, :for, :begin, :or, :not, :in, :when, :then, :case, :else, :do, :rescue, :ensure, :elsif, :def ]
# ^ punctuation.section.array.begin.ruby
#   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#    ^^^^^ constant.language.symbol.ruby
#         ^ punctuation.separator.object.ruby
#           ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#            ^^^^^^ constant.language.symbol.ruby
#                  ^ punctuation.separator.object.ruby
#                    ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                     ^^ constant.language.symbol.ruby
#                       ^ punctuation.separator.object.ruby
#                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                          ^^^^^^ constant.language.symbol.ruby
#                                ^ punctuation.separator.object.ruby
#                                  ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                   ^^^^^ constant.language.symbol.ruby
#                                        ^ punctuation.separator.object.ruby
#                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                           ^^^ constant.language.symbol.ruby
#                                              ^ punctuation.separator.object.ruby
#                                                ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                 ^^^ constant.language.symbol.ruby
#                                                    ^ punctuation.separator.object.ruby
#                                                      ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                       ^^^^^ constant.language.symbol.ruby
#                                                            ^ punctuation.separator.object.ruby
#                                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                               ^^ constant.language.symbol.ruby
#                                                                 ^ punctuation.separator.object.ruby
#                                                                   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                    ^^^ constant.language.symbol.ruby
#                                                                       ^ punctuation.separator.object.ruby
#                                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                          ^^ constant.language.symbol.ruby
#                                                                            ^ punctuation.separator.object.ruby
#                                                                              ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                               ^^^^ constant.language.symbol.ruby
#                                                                                   ^ punctuation.separator.object.ruby
#                                                                                     ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                      ^^^^ constant.language.symbol.ruby
#                                                                                          ^ punctuation.separator.object.ruby
#                                                                                            ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                             ^^^^ constant.language.symbol.ruby
#                                                                                                 ^ punctuation.separator.object.ruby
#                                                                                                   ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                    ^^^^ constant.language.symbol.ruby
#                                                                                                        ^ punctuation.separator.object.ruby
#                                                                                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                           ^^ constant.language.symbol.ruby
#                                                                                                             ^ punctuation.separator.object.ruby
#                                                                                                               ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                                ^^^^^^ constant.language.symbol.ruby
#                                                                                                                      ^ punctuation.separator.object.ruby
#                                                                                                                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                                         ^^^^^^ constant.language.symbol.ruby
#                                                                                                                               ^ punctuation.separator.object.ruby
#                                                                                                                                 ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                                                  ^^^^^ constant.language.symbol.ruby
#                                                                                                                                       ^ punctuation.separator.object.ruby
#                                                                                                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                                                                          ^^^ constant.language.symbol.ruby
#                                                                                                                                              ^ punctuation.section.array.end.ruby

