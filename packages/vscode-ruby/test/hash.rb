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
