# ICCapi
An api that serves data regarding the climbing routes available at the indoor climbing center at Oregon State University. The previous version of the full site already exists at [iccroutes](https://iccroutes.com). When this project is finished it'll replace it. This project is mostly intended to help me learn rails and react at the same time. Save your judgement. 

## Design
+ Backend:  [Ruby on Rails](https://github.com/rails/rails)
+ Frontend: [React](https://github.com/facebook/react)
+ database: MySQL

***

**Shouts out to:**
- [active_model_serializers](https://github.com/rails-api/active_model_serializers)
- [react-rails](https://github.com/reactjs/react-rails)
- [devise] (https://github.com/plataformatec/devise)


### Update:
Instead of having two discrete projects (api and client-side) I've switched to rendering the views through rails and rendering react components in those views until the api is finished and then I'll move the components over and make an entirely static client side with react-router.
