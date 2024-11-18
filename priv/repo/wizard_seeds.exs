alias Pensieve.Hogwarts.Wizard
alias Pensieve.Repo

%{
  "Gryffindor" => ["Harry Potter", "Hermione Granger", "Ron Weasley", "Ginny Weasley"],
  "Hufflepuff" => ["Cho Chang", "Luna Lovegood"],
  "Ravenclaw" => ["Cedric Diggory"],
  "Slytherin" => ["Draco Malfoy", "Vincent Crabbe", "Gregory Goyle"],
}
|>
Enum.each(fn member ->
  { house,  wizards} = member
  for w <- wizards do
    [first , last | _] = String.split(w)
    Repo.insert!(
      %Wizard{
        first_name: first,
        last_name: last,
        house: house,
        points: :rand.uniform(50)+50
    })
  end
end)
    
