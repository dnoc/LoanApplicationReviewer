# LoanApplicationReviewer

**Newer and actually working solution is in the other repo: [LoanApplicationReviewerv2](https://github.com/dnoc/LoanApplicationReviewerv2)

This is my solution to a code challenge from an interview.

The prompt can be viewed [here](./prompt.md), but essentially it's a script to review and approve/deny mortgage applications.

## How to run

1. Pull this repo and make sure you have ruby installed.

1. Create an input file matching the schema [here](./prompt.md#schema)

1. In a terminal run the ruby script with the input file e.g. ```ruby review_applications.rb input.txt```

## How to test

1. Navigate to `test/`

1. In a terminal run the spec, e.g. ```rspec -f d application_service_spec.rb```

## Initial thoughts (chronological order)

Rough outline of steps
- repo, readme
- read input file
- write output
- build models
- build validations and relations
- Approve/deny
- calculate DTI and credit score

Initially started setting up Rails but that's overkill, probably just need to pull in ActiveModel for validations.

I could do this in Java but custom validations are tedious, I think ActiveModel/`valid?`/`errors` are less overhead.

I don't need a database but I'll try to lay out some basic relations so it's obvious how this would be expanded if it was in prod.

Nevermind, trying to load in all the required object in memory and adding them to the correct class attributes seems like a major pain.
Instead I'll create a small rails project so I can save and utilize ActiveRecord associations.

Normally in a prod situation we'd probably have a request in json or similar to a controller that we can check conforms to an object,
but here I guess I need a class or at least private function to create objects from the text file.

This is a great example for a factory pattern since the string input is supposed to be reliable and one object is created from each line.
The models can define the criteria and the `build` method to keep the responisibility in the class.
In a much more complicated situation we could get into polymorphism but that's obviously not necessary here.

The prompt sort of hints at `Borrower` associations with `Liability` and `Income` containing `name` fields,
but it's not actually used for anything in the `Requirements/Constraints` for the solution.
It'd be useful in a real world example or if the criteria gets extended in the interview.

I stored the `A1/A2` strings as `:provided_id, :string` so that they could be saved on repeated runs without issue.
A database id is a lot more consistent than any user input e.g. an email, username, application name.

I could have stored the money fields as integers in cents but since I'm definitely doing division for `dti` I might as well
use `:decimal`/`BigDecimal` and save myself the conversion.
Plus with this small of an app there's not much worry about `BigDecimal` vs integer performance.
It goes without saying that float is very inconsistent for this kind of thing.

Decided to create an ApplicationDecision as a historical record with `attr_reader` only,
since a company would want a record of the inputs and outputs of the approval decision.
Even more useful if the Borrower associations existed and the liabilities/incomes ever changed.

There's a massive issue with the model being named `Application` which is breaking `new` for all my objects. What a hassle. Now I'm renaming to LoanApplication.

`new` is broken. I've never seen anything like this:
```
ApplicationObjectFactory#from_string with loan input string
     Failure/Error: Loan.new(loan_application_id, tokens[1], tokens[2], tokens[3], tokens[4])

     ArgumentError:
       wrong number of arguments (given 5, expected 0..1)
     # ./app/models/loan.rb:20:in `build_from_string'
     # ./app/services/application_object_factory.rb:7:in `from_string'
     # ./spec/services/application_object_factory_spec.rb:5:in `block (3 levels) in <top (required)>'
     # ./spec/services/application_object_factory_spec.rb:14:in `block (4 levels) in <top (required)>'
```
I'm pulling my hair out here! I may scrap this project, I don't see how anything could work after this.

## TODOs

- [x] Object `build_from_string` methods
- [ ] Tests for services
- [ ] Tests for model methods
- [ ] Run with given input
- [ ] Run with different input
- [ ] Confirm any more required packages for project setup
- [ ] Project files cleanup
- [ ] Readme cleanup

## Retrospective

I spent a lot of time setting up my dev environment, as this is my personal Windows machine and I didn't have the required Rails packages.
It's a lot easier to do this sort of project as well when you can double-check against coworkers's code for simple formatting stuff like `t.column :years, :string, null: false`.
I have google and a copy of the Rails Way but it's definitely slower.

Seems like I went a bit overboard, I wonder how much work other applicants put in.
It seems crucial to me though to include validations, schema, and relations, as those are some of the most important decisions you can make in software.