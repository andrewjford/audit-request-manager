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
manager = User.create(email: 'boblob@bll.com', password: 'asdfasdf', name: 'Bob Lob',
  organization_attributes: {name: 'Bob Lob Law LLP'}, role: 1)
auditor = User.create(email: 'lalaw@bll.com', password: 'asdfasdf', name: 'Laura Law',
  organization_attributes: {name: 'Bob Lob Law LLP'}, role: 2)
client = User.create(email: 'mary@exco.com', password: 'asdfasdf', name: 'Mary Smith',
  organization_attributes: {name: 'Example Co. LLC'}, role: 3)

#create example project
example_project = manager.projects.create(title: "Example Audit 2017", auditee: "Example Co. LLC")
example_project.users << auditor
example_project.users << client

#create example requests
req1 = example_project.requests.create(title: "FYE 2017 TB", description:
  "Please provide the final TB.", user: manager, status: "Open", request_number:
  example_project.request_counter)
req2 = example_project.requests.create(title: "Bank Accounts", description:
  "Please provide a list of bank accounts used by the organization during the year.
  Include bank, bank account number, and corresponding TB account.", user: auditor,
  status: "Open", request_number: example_project.request_counter)
example_project.requests.create(title: "Bank Reconciliations", description:
  "Please provide bank reconciliations for each cash account.", user: auditor,
  status: "Open", request_number: example_project.request_counter)
req4 = example_project.requests.create(title: "FY 2017 GL Detail", description:
  "Please provide the full GL detail.", user: auditor, status: "Open", request_number:
  example_project.request_counter)
example_project.requests.create(title: "AR Schedule and reconciliation", description:
  "Please provide the AR schedule for FYE and any reconciliations to the TB",
   user: auditor, status: "Open", request_number: example_project.request_counter)
example_project.requests.create(title: "AP Schedule", description:
  "Please provide the AP schedule for FYE", user: auditor, status: "Open",
  request_number: example_project.request_counter)

#create example comments
example_project.requests.find_by(request_number: 1).comments.create(content: "See uploaded.",
user: client)
example_project.requests.find_by(request_number: 1).comments.create(content: "Thank you.",
user: manager)
req1.status = "Closed"
req1.save

example_project.requests.find_by(request_number: 2).comments.create(content:
  "Uploaded. We closed the BoA in February.", user: client)
req2.status = "Client Submitted"
req2.save
req4.status = "Client Submitted"
req4.save
