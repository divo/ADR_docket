# README

## Intro

Simple Rails app to generate delivery dockets compliant the UN ADR regulations.

Originally written to replace a Java app I wrote when I was in college, after the computer it was installed on was lost and I was 5000 miles away.

I then fixed it up a bit into something that could just about be used by others. The main aim of this later revision was to learn how to production-ize and ship a Rails app.

## Functionality

- Basic landing page, becomes Docket list when logged in.
- Login. Home rolled RBAC. Don't do that again.
- Signup.
- Help request form. Home rolled ActionMailer. Adding validations was a pain.
- New docket form. Very simple form allowing for all the basic information to be input.
  - The Address and Hazardous input sub-forms are confusing. It's not clear to the User if they have selected and existing record or input a new one. Tidying this up would require some JS fanciness and I wasn't willing to spend time on it.
- Docket Print. The main feature of this is to generate forms for physical printing. The layout moves around a little but overall it's serviceable. 
- **Styling**. Spent a bit of time creating a style sheet I can reuse. It wont win any awards but it's simple and clean.
- Metrics. Home rolled, broken out to another repo.

## TODO
- [] Address / Haz is UX is bad.
- [] Forgot password form
- [] Setup a job queue for the metrics
??
