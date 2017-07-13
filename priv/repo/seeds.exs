# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Present.Repo.insert!(%Present.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Present.Repo
alias Present.Accounts.User
alias Present.Accounts.UserPlace
alias Present.Map.Place

Repo.insert!(%Place{
  :city => "Uzès",
  :department => "Gard",
  :latitude => 44.2167,
  :longitude => 4.6167,
  :title => "foobar",
})

Repo.insert!(%UserPlace{
  :user_id => 1,
  :place_id => 1
})
