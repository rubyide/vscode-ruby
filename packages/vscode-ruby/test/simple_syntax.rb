# SYNTAX TEST "source.ruby"

if foo && bar && baz
#  ^^^ variable.other.ruby
#         ^^^ variable.other.ruby
#                ^^^ variable.other.ruby
end

foo && bar && baz
# <--- variable.other.ruby
#      ^^^ variable.other.ruby
#             ^^^ variable.other.ruby
