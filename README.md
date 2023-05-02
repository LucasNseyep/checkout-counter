# NOVICAP

# Code Challenge - Physical Store Checkout - Lucas Nseyep Solution

## Instructions

To run the solution:

```bash
# After adding your scanned items to `lib/interface.rb`
ruby lib/interface.rb
```

To run the tests (and linter):

```bash
rake
```

## Assumptions and Decisions
- There is a finite number of ([core](https://www.indeed.com/career-advice/career-development/discounts-types)) discount and deal types. We can therefore write code for each type i.e. "n for 1" discounts ("n=1"), value discounts ("1=1"), etc.
- The json was has the products and their discounts seperated into two sections because it will make the introduction of new deals like bundles easier to integrate.
- It was decided not to test specific discounts within the json because they are very likely to change over time



## Possible Improvements / What would I do if I had more time?
- The "n for 1" discount could be furthere generalised to "n for m"
