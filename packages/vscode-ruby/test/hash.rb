# SYNTAX TEST "source.ruby"

find!(id: 1, id2: 2)
#     ^^ constant.language.symbol.hashkey.ruby
#       ^ punctuation.definition.constant.hashkey.ruby
#            ^^^ constant.language.symbol.hashkey.ruby
#               ^ punctuation.definition.constant.hashkey.ruby
find!({ id: 1, id2: 2 })
#       ^^ constant.language.symbol.hashkey.ruby
#         ^ punctuation.definition.constant.hashkey.ruby
#              ^^^ constant.language.symbol.hashkey.ruby
#                 ^ punctuation.definition.constant.hashkey.ruby

Candidate.find!(id: 1, id2: 2)
#               ^^ constant.language.symbol.hashkey.ruby
#                 ^ punctuation.definition.constant.hashkey.ruby
#                      ^^^ constant.language.symbol.hashkey.ruby
#                         ^ punctuation.definition.constant.hashkey.ruby
Candidate.find!({ id: 1, id2: 2 })
#                 ^^ constant.language.symbol.hashkey.ruby
#                   ^ punctuation.definition.constant.hashkey.ruby
#                        ^^^ constant.language.symbol.hashkey.ruby
#                           ^ punctuation.definition.constant.hashkey.ruby

  {
# ^ punctuation.section.scope.begin.ruby
    simple_key: :value,
#   ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#             ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#               ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                ^^^^^ constant.language.symbol.ruby
#                     ^ punctuation.separator.object.ruby
    ends_with_question_mark?: :value,
#   ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                           ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                             ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                              ^^^^^ constant.language.symbol.ruby
#                                   ^ punctuation.separator.object.ruby
    ends_with_excalm_key!: :value
#   ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                           ^^^^^ constant.language.symbol.ruby
  }
# ^ punctuation.section.scope.end.ruby
  
  def method({ simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value })
# ^^^ keyword.control.def.begin.ruby
#     ^^^^^^ entity.name.function.ruby
#           ^ punctuation.definition.parameters.ruby
#            ^ punctuation.section.scope.begin.ruby
#             ^ meta.syntax.ruby.start-block
#              ^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                        ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                           ^^^^^ constant.language.symbol.ruby
#                                ^ punctuation.separator.object.ruby
#                                  ^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                          ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                            ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                             ^^^^^ constant.language.symbol.ruby
#                                                                  ^ punctuation.separator.object.ruby
#                                                                    ^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                                                         ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                                                           ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                            ^^^^^ constant.language.symbol.ruby
#                                                                                                  ^ punctuation.section.scope.end.ruby
#                                                                                                   ^ punctuation.definition.parameters.ruby
    nil
#   ^^^ constant.language.nil.ruby
  end
# ^^^ keyword.control.end.ruby keyword.control.def.end.ruby

  def method(simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value)
# ^^^ keyword.control.def.begin.ruby
#     ^^^^^^ entity.name.function.ruby
#           ^ punctuation.definition.parameters.ruby
#            ^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                      ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                         ^^^^^ constant.language.symbol.ruby
#                              ^ punctuation.separator.object.ruby
#                                ^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                        ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                           ^^^^^ constant.language.symbol.ruby
#                                                                ^ punctuation.separator.object.ruby
#                                                                  ^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                                                       ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                          ^^^^^ constant.language.symbol.ruby
#                                                                                               ^ punctuation.definition.parameters.ruby
    nil
#   ^^^ constant.language.nil.ruby
  end
# ^^^ keyword.control.end.ruby keyword.control.def.end.ruby

  def method { simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value }
# ^^^ keyword.control.def.begin.ruby
#     ^^^^^^ entity.name.function.ruby
#            ^ punctuation.section.scope.begin.ruby
#             ^ meta.syntax.ruby.start-block
#              ^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                        ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                           ^^^^^ constant.language.symbol.ruby
#                                ^ punctuation.separator.object.ruby
#                                  ^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                          ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                            ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                             ^^^^^ constant.language.symbol.ruby
#                                                                  ^ punctuation.separator.object.ruby
#                                                                    ^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                                                         ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                                                           ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                            ^^^^^ constant.language.symbol.ruby
#                                                                                                  ^ punctuation.section.scope.end.ruby
    nil
#   ^^^ constant.language.nil.ruby
  end
# ^^^ keyword.control.end.ruby keyword.control.def.end.ruby

  def method simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value
# ^^^ keyword.control.def.begin.ruby
#     ^^^^^^ entity.name.function.ruby
#            ^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                      ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                         ^^^^^ constant.language.symbol.ruby
#                              ^ punctuation.separator.object.ruby
#                                ^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                        ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                           ^^^^^ constant.language.symbol.ruby
#                                                                ^ punctuation.separator.object.ruby
#                                                                  ^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.hashkey.parameter.function.ruby
#                                                                                       ^ constant.other.symbol.hashkey.parameter.function.ruby punctuation.definition.constant.ruby
#                                                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                          ^^^^^ constant.language.symbol.ruby
    nil
#   ^^^ constant.language.nil.ruby
  end
# ^^^ keyword.control.end.ruby keyword.control.def.end.ruby

  foo.method { simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value }
# ^^^ variable.other.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^^ entity.name.function.ruby
#            ^ punctuation.section.scope.begin.ruby
#             ^ meta.syntax.ruby.start-block
#              ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                           ^^^^^ constant.language.symbol.ruby
#                                ^ punctuation.separator.object.ruby
#                                  ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                            ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                             ^^^^^ constant.language.symbol.ruby
#                                                                  ^ punctuation.separator.object.ruby
#                                                                    ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                           ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                            ^^^^^ constant.language.symbol.ruby
#                                                                                                  ^ punctuation.section.scope.end.ruby

  foo.method simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value
# ^^^ variable.other.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^^ entity.name.function.ruby
#            ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                         ^^^^^ constant.language.symbol.ruby
#                              ^ punctuation.separator.object.ruby
#                                ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                           ^^^^^ constant.language.symbol.ruby
#                                                                ^ punctuation.separator.object.ruby
#                                                                  ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                          ^^^^^ constant.language.symbol.ruby

  foo.method(simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value)
# ^^^ variable.other.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^^ entity.name.function.ruby
#           ^ punctuation.section.function.ruby
#            ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                         ^^^^^ constant.language.symbol.ruby
#                              ^ punctuation.separator.object.ruby
#                                ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                           ^^^^^ constant.language.symbol.ruby
#                                                                ^ punctuation.separator.object.ruby
#                                                                  ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                       ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                         ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                          ^^^^^ constant.language.symbol.ruby
#                                                                                               ^ punctuation.section.function.ruby

  foo.method({ simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value })
# ^^^ variable.other.ruby
#    ^ punctuation.separator.method.ruby
#     ^^^^^^ entity.name.function.ruby
#           ^ punctuation.section.function.ruby
#            ^ punctuation.section.scope.begin.ruby
#             ^ meta.syntax.ruby.start-block
#              ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                        ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                          ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                           ^^^^^ constant.language.symbol.ruby
#                                ^ punctuation.separator.object.ruby
#                                  ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                          ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                            ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                             ^^^^^ constant.language.symbol.ruby
#                                                                  ^ punctuation.separator.object.ruby
#                                                                    ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                         ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                           ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                            ^^^^^ constant.language.symbol.ruby
#                                                                                                  ^ punctuation.section.scope.end.ruby
#                                                                                                   ^ punctuation.section.function.ruby

  method(simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value)
# ^^^^^^ entity.name.function.ruby
#       ^ punctuation.section.function.ruby
#        ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                    ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                     ^^^^^ constant.language.symbol.ruby
#                          ^ punctuation.separator.object.ruby
#                            ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                      ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                       ^^^^^ constant.language.symbol.ruby
#                                                            ^ punctuation.separator.object.ruby
#                                                              ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                     ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                      ^^^^^ constant.language.symbol.ruby
#                                                                                           ^ punctuation.section.function.ruby

  method({ simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value })
# ^^^^^^ entity.name.function.ruby
#       ^ punctuation.section.function.ruby
#        ^ punctuation.section.scope.begin.ruby
#         ^ meta.syntax.ruby.start-block
#          ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                      ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                       ^^^^^ constant.language.symbol.ruby
#                            ^ punctuation.separator.object.ruby
#                              ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                         ^^^^^ constant.language.symbol.ruby
#                                                              ^ punctuation.separator.object.ruby
#                                                                ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                       ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                        ^^^^^ constant.language.symbol.ruby
#                                                                                              ^ punctuation.section.scope.end.ruby
#                                                                                               ^ punctuation.section.function.ruby

  method { simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value }
# ^^^^^^ variable.other.ruby
#        ^ punctuation.section.scope.begin.ruby
#         ^ meta.syntax.ruby.start-block
#          ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                      ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                       ^^^^^ constant.language.symbol.ruby
#                            ^ punctuation.separator.object.ruby
#                              ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                      ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                        ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                         ^^^^^ constant.language.symbol.ruby
#                                                              ^ punctuation.separator.object.ruby
#                                                                ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                     ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                       ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                        ^^^^^ constant.language.symbol.ruby
#                                                                                              ^ punctuation.section.scope.end.ruby

  method simple_key: :value, ends_with_question_mark?: :value, ends_with_excalm_key!: :value
# ^^^^^^ variable.other.ruby
#        ^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                  ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                    ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                     ^^^^^ constant.language.symbol.ruby
#                          ^ punctuation.separator.object.ruby
#                            ^^^^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                    ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                      ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                       ^^^^^ constant.language.symbol.ruby
#                                                            ^ punctuation.separator.object.ruby
#                                                              ^^^^^^^^^^^^^^^^^^^^^ constant.language.symbol.hashkey.ruby
#                                                                                   ^ constant.language.symbol.hashkey.ruby punctuation.definition.constant.hashkey.ruby
#                                                                                     ^ constant.language.symbol.ruby punctuation.definition.constant.ruby
#                                                                                      ^^^^^ constant.language.symbol.ruby
