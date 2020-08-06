Volunteer.delete_all
Project.delete_all

kristen = Volunteer.create!(firstname: 'Kristen', lastname: 'D', email: 'kristen@me.com', password: 'pass', pronouns: 'she/her', qtlgbt: 'true')
eliseo = Volunteer.create!(firstname: 'Eliseo', lastname: 'T', email: 'eliseo@me.com', password: 'pass', pronouns: 'they/them', qtlgbt: 'true', bipoc: 'true')

pride = Project.create(name: 'Pride 2020', completed: 1, assigned: 1, role: 'coordinator', number_of_hours: 8)
shefest = Project.create(name: 'Virtual SheFEST', completed: 1, assigned: 1, role: 'interpreter', number_of_hours: 8)
