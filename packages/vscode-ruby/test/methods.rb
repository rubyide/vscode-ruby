# SYNTAX TEST "source.ruby"
  def method; hello, world = [1,2] end # test comment
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#           ^ meta.function.method.without-arguments.ruby punctuation.separator.statement.ruby
#             ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#                  ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#                    ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#                          ^ meta.function.method.without-arguments.ruby keyword.operator.assignment.ruby
#                            ^ meta.function.method.without-arguments.ruby punctuation.section.array.begin.ruby
#                             ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                              ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#                               ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                                ^ meta.function.method.without-arguments.ruby punctuation.section.array.end.ruby
#                                  ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                      ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                       ^^^^^^^^^^^^^ comment.line.number-sign.ruby


  def method # test comment
# ^^^ meta.function.method.without-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^ meta.function.method.without-arguments.ruby entity.name.function.ruby
#            ^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#             ^^^^^^^^^^^^^ meta.function.method.without-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#        ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.without-arguments.ruby variable.other.ruby
#                ^ meta.function.method.without-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.without-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.without-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.without-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.without-arguments.ruby punctuation.section.array.end.ruby
  end
# ^^^ meta.function.method.without-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_with_parentheses(*a, **b, &c) hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                              ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                 ^^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                      ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                       ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                        ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                 ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                       ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                         ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                          ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                            ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                             ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                               ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                   ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                    ^^^^^^^^^^^^^ comment.line.number-sign.ruby


  def method_with_parentheses(a, b, c = [foo,bar,baz]) hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                     ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                            ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                   ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                                      ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                             ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                                   ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                     ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                           ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                               ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                ^^^^^^^^^^^^^ comment.line.number-sign.ruby


  def method_with_parentheses(a, b, c = [foo,bar,baz]) # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                     ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                        ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                            ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                   ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                                      ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                       ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_with_parentheses(a, b = "hello", c = ["foo", "bar"], d = (2 + 2) * 2, e = {}) # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                  ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                    ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                     ^^^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                          ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                 ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                  ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                   ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                      ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                          ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                             ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                              ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                               ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                 ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                   ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                     ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                          ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                           ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                                                             ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                               ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                                ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                                  ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                                    ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                                      ^ meta.function.method.with-arguments.ruby punctuation.section.scope.begin.ruby
#                                                                                       ^ meta.function.method.with-arguments.ruby punctuation.section.scope.end.ruby
#                                                                                        ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                                                                                          ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                           ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_with_parentheses(a,
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                            ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                              b = hello, # test comment
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                 ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                      ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                        ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                         ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
                              c = ["foo", bar, :baz],
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                  ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                   ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                      ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                         ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                            ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                              ^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                               ^^^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                   ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                              d = (2 + 2) * 2,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                  ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                    ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                      ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                         ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                           ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                            ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                              e = {})
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                             ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                               ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.section.scope.begin.ruby
#                                  ^ meta.function.method.with-arguments.ruby punctuation.section.scope.end.ruby
#                                   ^ meta.function.method.with-arguments.ruby punctuation.definition.parameters.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_without_parentheses a, b, c = [foo,bar,baz]; hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                        ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                          ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                           ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                               ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                                                         ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                          ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                           ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                            ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                              ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                                  ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                   ^^^^^^^^^^^^^ comment.line.number-sign.ruby


  def method_without_parentheses a, b, c = [foo,bar,baz] # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                        ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                          ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                           ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                               ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                   ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                        ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                         ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_without_parentheses a, b = "hello", c = ["foo", "bar"], d = (2 + 2) * 2, e = "" # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                   ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                     ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                       ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                        ^^^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                             ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                  ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                     ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                      ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                          ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                            ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                             ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                                                ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                 ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                    ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                      ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                        ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                                                         ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                           ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                             ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                              ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                                                                ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                                                  ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                                   ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                                                     ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                                                                       ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                                                                          ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                                                                            ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                                             ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_without_parentheses a,    
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                                ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                  ^^^^^ meta.function.method.with-arguments.ruby
                                b = "hello"  , # test comment
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                   ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                    ^^^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                         ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                          ^^ meta.function.method.with-arguments.ruby
#                                            ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                              ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                               ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
                                c = ["foo", bar, :baz],
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                   ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                    ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.begin.ruby
#                                     ^^^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby
#                                        ^ meta.function.method.with-arguments.ruby string.quoted.double.interpolated.ruby punctuation.definition.string.end.ruby
#                                         ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                           ^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                ^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                 ^^^ meta.function.method.with-arguments.ruby constant.language.symbol.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                     ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
                                d = (2 + 2) * 2,
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                   ^ meta.function.method.with-arguments.ruby punctuation.section.function.begin.ruby
#                                    ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                      ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                        ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                         ^ meta.function.method.with-arguments.ruby punctuation.section.function.end.ruby
#                                           ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                             ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby

# meta.function.method.with-arguments.ruby
                                e = proc { |e| e + e }  
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby
#                               ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                 ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                   ^^^^ meta.function.method.with-arguments.ruby support.function.kernel.ruby
#                                        ^ meta.function.method.with-arguments.ruby punctuation.section.scope.begin.ruby
#                                         ^ meta.function.method.with-arguments.ruby meta.syntax.ruby.start-block
#                                          ^ meta.function.method.with-arguments.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                           ^ meta.function.method.with-arguments.ruby meta.block.parameters.ruby variable.other.block.ruby
#                                            ^ meta.function.method.with-arguments.ruby meta.block.parameters.ruby punctuation.separator.variable.ruby
#                                              ^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                ^ meta.function.method.with-arguments.ruby keyword.operator.arithmetic.ruby
#                                                  ^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                    ^ meta.function.method.with-arguments.ruby punctuation.section.scope.end.ruby
#                                                     ^^^ meta.function.method.with-arguments.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
    do_something1
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
    do_something2
#   ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby


  def method_without_parentheses *a, **b, &c; hello, world = [1,2] end # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                                ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                 ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                    ^^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                         ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                          ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                           ^ meta.function.method.with-arguments.ruby punctuation.separator.statement.ruby
#                                             ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                    ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                                                          ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                                                            ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                                                             ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                              ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                                               ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                                                                ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
#                                                                  ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby
#                                                                      ^ comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                                                       ^^^^^^^^^^^^^ comment.line.number-sign.ruby


  def method_without_parentheses *a, **b, &c # test comment
# ^^^ meta.function.method.with-arguments.ruby keyword.control.def.begin.ruby
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby entity.name.function.ruby
#                                ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                 ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                  ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                    ^^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                      ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                       ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                                         ^ meta.function.method.with-arguments.ruby storage.type.variable.ruby
#                                          ^ meta.function.method.with-arguments.ruby variable.parameter.function.ruby
#                                            ^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby punctuation.definition.comment.ruby
#                                             ^^^^^^^^^^^^^ meta.function.method.with-arguments.ruby comment.line.number-sign.ruby
    hello, world = [1,2]
#   ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#        ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#          ^^^^^ meta.function.method.with-arguments.ruby variable.other.ruby
#                ^ meta.function.method.with-arguments.ruby keyword.operator.assignment.ruby
#                  ^ meta.function.method.with-arguments.ruby punctuation.section.array.begin.ruby
#                   ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                    ^ meta.function.method.with-arguments.ruby punctuation.separator.object.ruby
#                     ^ meta.function.method.with-arguments.ruby constant.numeric.ruby
#                      ^ meta.function.method.with-arguments.ruby punctuation.section.array.end.ruby
  end
# ^^^ meta.function.method.with-arguments.ruby keyword.control.end.ruby keyword.control.def.end.ruby

