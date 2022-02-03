# LoanApplicationReviewer

This is my solution to a code challenge from an interview.

The prompt can be viewed [here](./prompt.md), but essentially it's a script to review and approve/deny mortgage applications.

## How to run

1. Pull this repo and make sure you have ruby installed. (TODO confirm any more required packages)

1. Create an input file matching the schema [here](./prompt.md#schema)

1. In a terminal run the ruby script with the input file e.g. ```ruby review_applications.rb input.txt```

1. Celebrate

## Initial thoughts

steps
- repo, readme

- read input file
- write output
- build models
- build validations and relations
- Approve/deny
- calculate DTI and credit score

Struggled a bit setting up my dev environment on my personal Windows machine
Initially started setting up Rails but that's overkill, probably just need to pull in ActiveModel for validations
I could do this in Java but custom validations are tedious, I think ActiveModel/`valid?`/`errors` are less overhead
I don't need a database but I'll try to lay out some basic relations so it's obvious how this would be expanded if it was in prod.

Normally in a prod situation we'd probably have a request in json or similar to a controller that we can check conforms to an object,
but here I guess I need a class or at least private function to create objects from the text file. 