# Physical Store Checkout
## Instructions

To run the solution:

```bash
# After adding your scanned items to `lib/interface.rb`

ruby lib/interface.rb
```

To run the tests (and linter):

```bash
# The tests were made using rake and rspec. Please make sure that those are installed in your environment.

rake
```

## Assumptions and Decisions
- There are a finite number of ([core](https://www.indeed.com/career-advice/career-development/discounts-types)) discount and deal types. We can therefore write code for each type i.e. "n for m" discounts ("n=m"), value discounts ("1=1"), etc.
- The json has the products and their discounts seperated into two sections. This makes reading the json easier and will make the introduction of new deals (e.g., bundles, ...) simpler.
- The examples given in the challenge description were not added as tests because products and discounts are very likely to change — "Our team will add, remove, and change products and discounts, [...]".

## Possible Improvements
- Create unit tests to check if each product has an associated price (could require a `test.json`)
- Create unit tests for each type of discount (could require a `test.json`)
