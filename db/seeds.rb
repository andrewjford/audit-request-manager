# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create users
uber = User.create(email: 'admin@admin.admin', password: 'asdfasdf', name: 'AJF',
  organization_attributes: {name: 'AuditRequest'}, role: 0)
manager = User.create(email: 'bob@blb.com', password: 'asdfasdf', name: 'Bob Loblaw',
  organization_attributes: {name: 'Bob Loblaw LLP'}, role: 1)
auditor = User.create(email: 'lolby@blb.com', password: 'asdfasdf', name: 'Laura Olby',
  organization_attributes: {name: 'Bob Loblaw LLP'}, role: 2)
client = User.create(email: 'mary@exco.com', password: 'asdfasdf', name: 'Mary Smith',
  organization_attributes: {name: 'Example Co. LLC'}, role: 3)


uber.projects.create(title: "Example Audit 2017", auditee: "Example Co. LLC")

example_project = uber.projects.last

example_project.requests.create()
