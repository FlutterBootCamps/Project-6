# Flutter API Integration Project

# Overview
In this project we're using a fake store restful API and using it to make a full shopping application.

## Logo
This is the logo made and used within as the application icon, and in its splash screen.
<br><br>
![Thingzz_Logo](https://github.com/hmody360/Project-6/assets/98014312/2a02bf44-017f-49ad-97f0-60167259761d)
<br><br>

## Signup Page
In this page, the user is able to create their own account, as well as adding an optional profile picture, the user can also go straight into the Login Page to log in:
<br><br>
<img width="198" alt="project6_p1" src="https://github.com/hmody360/Project-6/assets/98014312/b9a92ca0-41d6-4356-97d1-3cf9d2084684">
<img width="197" alt="project6_p2" src="https://github.com/hmody360/Project-6/assets/98014312/ef130370-ef60-4b00-b780-70d715ba7401">
<br><br>

There are many states the user may encounter when trying to signup, these states are:

- State 1: The user tried to sign up with some or all empty fields

<img width="196" alt="project6_p3" src="https://github.com/hmody360/Project-6/assets/98014312/e463deed-2fce-4b4a-8de9-beb7da5ae6ee">
<br><br>

- State 2: The user tried to signup with a wrong email format

<img width="195" alt="project6_p4" src="https://github.com/hmody360/Project-6/assets/98014312/cefa5e56-e0dd-4fb6-b968-8da6e9428a96">
<br><br>

- State 3: The user picked (or didn't pick) their image and filled all info correctly, then signed up

<img width="198" alt="project6_p5" src="https://github.com/hmody360/Project-6/assets/98014312/9a90af3b-a7d7-4f91-97ce-7f7833e0b6cb">
<img width="197" alt="project6_p6" src="https://github.com/hmody360/Project-6/assets/98014312/52511259-6385-47f1-818f-412f5c903c3c">
<img width="198" alt="project6_p7" src="https://github.com/hmody360/Project-6/assets/98014312/a2c16832-3d0f-47a9-b357-95ee7b7d0be8">
<img width="197" alt="project6_p8" src="https://github.com/hmody360/Project-6/assets/98014312/89c73d0b-5bec-4767-9bc2-6dfcb4c385be">
<br><br>

## Login Page
In this page the user is able to log into their account using their email and password, they are also able to visit the SignUp page to create a new account:
<br><br>
<img width="198" alt="project6_p9" src="https://github.com/hmody360/Project-6/assets/98014312/ef7ea2c2-95f6-4a81-baa1-54da73336007">

There are many states that the user may encounter while logging in, which are:

- State 1: The user tried to log in with empty text fields:

<img width="198" alt="project6_p10" src="https://github.com/hmody360/Project-6/assets/98014312/3db8644c-edc5-4f38-8f48-a06799ad1922">
<br><br>

- State 2: The user tried to login with an incorrect email format:

<img width="197" alt="project6_p11" src="https://github.com/hmody360/Project-6/assets/98014312/ebe798f7-31c7-4b6e-b76e-cb0fe9a8fdc3">
<br><br>

- State 3: The user tried to login with a nonexisting account, or incorrect combination of email and password:

<img width="197" alt="project6_p12" src="https://github.com/hmody360/Project-6/assets/98014312/091c2ca9-693a-48ef-a595-06977e198b83">
<br><br>

- State 4: The user inputted correct email and password, and logged in successfuly:

<img width="201" alt="project6_p13" src="https://github.com/hmody360/Project-6/assets/98014312/41bcfa22-cb6f-46b2-805d-9950aa447cfe">
<br><br>

## Navigation Page 
Through this page the user can traverse thrpugh the Home Page, Search Page, Basket Page, as well as the profile page.

the following pages are within the Navigation Page:

## Home Page
In this page the user can view all products or filter them by categories, as well as add products to basket and view each product's details:
<br><br>

<img width="196" alt="project6_p14" src="https://github.com/hmody360/Project-6/assets/98014312/d751e8fe-9c11-4a8f-b8b8-dcb6e546f800">
<img width="196" alt="project6_p15" src="https://github.com/hmody360/Project-6/assets/98014312/c951a4ee-c125-4a70-8b43-5711cddbb9a5">

### Adding to basket
The user can add a product to basket using its product card, or through a product's details page, if the user adds the item they will be notfied that its been added to the basket, and the basket will also mark how many items using a badge, if the user tries to add the item again, they will be told it's already in the basket (if it is in the basket):
<br><br>

<img width="198" alt="project6_p16" src="https://github.com/hmody360/Project-6/assets/98014312/32e6f9cd-5f67-446a-aa07-c661833b2179">
<img width="202" alt="project6_p17" src="https://github.com/hmody360/Project-6/assets/98014312/3174e287-036f-4d64-bb2d-e6b755aa0ad3">
<br><br>

## Product Details Page
When the user clicks on a product's card, they can view the product page, which has many info about the project, and an image carousel of all product's images, (if it only has one image it will display only 1 with no auto scroll), and the ability to add to basket through here aswell:
<br><br>

<img width="197" alt="project6_p18" src="https://github.com/hmody360/Project-6/assets/98014312/9d538fed-0b42-4013-ad03-2583b5801dec">
<img width="201" alt="project6_p19" src="https://github.com/hmody360/Project-6/assets/98014312/24adb448-b61b-4175-9d88-a7cca711499f">
<img width="200" alt="project6_p20" src="https://github.com/hmody360/Project-6/assets/98014312/e1db168c-e5ec-4ea2-b908-8f3482400328">

## Search Page
In this page the user can search for a product by its name, the search bar is smart, if the products aren't loaded yet it will load then start searching when editing is complete, if the products are already loaded, it will search on textfield change:
<br><br>

<img width="200" alt="project6_p21" src="https://github.com/hmody360/Project-6/assets/98014312/ebece6f6-8706-43ab-ae19-7ea54664d9f5">
<img width="200" alt="project6_p22" src="https://github.com/hmody360/Project-6/assets/98014312/81520f44-a539-4014-bf04-81c5b6551fad">
<br><br>

## Basket Page
In this page the user is able to view their added to basket products, with their total price, as well as the ability to remove from the basket, we can notice how the total price and badge showing number of items changes, and also if no items are in the basket, the total, number of items badge, and items won't appear in the Basket Page:
<br><br>

<img width="201" alt="project6_p23" src="https://github.com/hmody360/Project-6/assets/98014312/27b25f70-0fea-4b0b-920f-dfdd0ca3e747">
<img width="200" alt="project6_p24" src="https://github.com/hmody360/Project-6/assets/98014312/a763f6be-f763-48f5-b0b0-b1ae0cb686f7">
<img width="200" alt="project6_p25" src="https://github.com/hmody360/Project-6/assets/98014312/c0c93734-6f57-421e-883c-c9c3f40a856f">
<img width="198" alt="project6_p26" src="https://github.com/hmody360/Project-6/assets/98014312/f68a388d-3a31-432d-97d6-8a7e69497f70">
<br><br>

## Profile Page
In this page the user can view their personal information as well as edit their name, and sign out, if the user is an admin, they will have a special nutton to access admin features, otherwise it won't appear:
<br><br>

<img width="199" alt="project6_p28" src="https://github.com/hmody360/Project-6/assets/98014312/fa3eb8ce-90dd-4c67-918e-8211667272df">
<img width="197" alt="project6_p29" src="https://github.com/hmody360/Project-6/assets/98014312/6eb60064-d4e7-4a3c-a48d-5297f9770b7e">
<br><br>

### Name Editing
The user can simply edit their name like so, and obviously they're not allowed to leave the textfield empty:
<br><br>

<img width="196" alt="project6_p30" src="https://github.com/hmody360/Project-6/assets/98014312/0732417e-90c4-4ab8-83f0-012e267f3baa">
<img width="199" alt="project6_p31" src="https://github.com/hmody360/Project-6/assets/98014312/6a3cf662-6a82-401a-9205-c24e66d55a80">
<img width="198" alt="project6_p32" src="https://github.com/hmody360/Project-6/assets/98014312/5448ef0b-4eb7-4095-ab0a-3171d9e03e09">

### Signing out
When the user signs out, the info related to them is removed, so that another account is able to log in, on that device:
<br><br>

<img width="199" alt="project6_p33" src="https://github.com/hmody360/Project-6/assets/98014312/4d6ad513-b93a-4857-b70f-90ad0f4393b0">
<img width="198" alt="project6_p34" src="https://github.com/hmody360/Project-6/assets/98014312/02644f44-eb6b-456a-8158-f8e3a22704b9">
<br><br>

So far all the features seen here can be accessed by all user types, now we'll see the admin features.
<hr>

## Admin Navigation Page
This page is only accessible by accounts that have the role of "admin", in this page the admin can traverse three pages that enable them to control the application content, which are the Admin Categories Page, Admin Products Page, Admin Users Page.

To access this page the user needs to be an admin, and go to their profile page, where they'll see the special admin button in their app bar:
<br><br>

<img width="201" alt="project6_p35" src="https://github.com/hmody360/Project-6/assets/98014312/1d933c18-cf50-41a5-bf2c-73e23247648a">
<img width="198" alt="project6_p36" src="https://github.com/hmody360/Project-6/assets/98014312/61d68f2e-77f7-491c-8752-406d3eb884ca">
<br><br>

## Admin Categories Page
In this page, the admin is able to view, search by ID, edit and add categories easily:
<br><br>

<img width="198" alt="project6_p37" src="https://github.com/hmody360/Project-6/assets/98014312/478ca63c-87b8-4b89-860b-a38cc6ec4d51">
<img width="197" alt="project6_p38" src="https://github.com/hmody360/Project-6/assets/98014312/430e8659-de13-47ee-ac89-f9114aec53fe">
<br><br>

### Search category by ID
The admin can type a category's ID and it will be displayed on the screen, on edit complete.
If the user leaves the search field empty, all the categories will be displayed.
The Search bar only enables int numbers to be entered, and also if the user enters a nonexistant category number, it will display a "no category found for this ID" message:
<br><br>

<img width="196" alt="project6_p39" src="https://github.com/hmody360/Project-6/assets/98014312/fe82e92f-a31b-42c2-a485-a7b2368cbe93">
<img width="197" alt="project6_p40" src="https://github.com/hmody360/Project-6/assets/98014312/063350ad-87e5-4402-9f92-b52c8def3e0c">
<br><br>

### Editing a category
The admin can edit a category by clicking on its edit icon, then they'll see its current name, and are able to change it, no empty fields allowed.
<br><br>

<img width="199" alt="project6_p41" src="https://github.com/hmody360/Project-6/assets/98014312/0cffbae2-0344-4af2-b17d-025ff5382d5a">
<img width="196" alt="project6_p42" src="https://github.com/hmody360/Project-6/assets/98014312/0ccf7765-59f5-47a2-a66f-3a3d4190253d">
<br><br>

### Adding a category
The admin is able to add a new category by clicking the floating add button, which will show them a bottom sheet with a textfield to create a new category, no empty textfields allowed.
<br><br>

<img width="196" alt="project6_p43" src="https://github.com/hmody360/Project-6/assets/98014312/3618eb19-e6de-4ddc-807d-4df827a1c1ff">
<img width="196" alt="project6_p44" src="https://github.com/hmody360/Project-6/assets/98014312/bfe58e9d-eb06-4174-9507-f5218bd3dcf1">
<img width="197" alt="project6_p45" src="https://github.com/hmody360/Project-6/assets/98014312/715cdc7b-6df8-4eeb-b2c8-5e73b672858b">
<br><br>

## Admin Products Page
In this page, the admin is able to view all products, search product by ID, edit a product and add a new product, similar to the categories page.
<br><br>

<img width="197" alt="project6_p46" src="https://github.com/hmody360/Project-6/assets/98014312/4c4e6490-59b4-4eb5-a6e2-27592f10993e">
<br><br>

### Search Product by ID
The admin can type a product's ID and it will be displayed on the screen, on edit complete.
If the user leaves the search field empty, all the products will be displayed.
The Search bar only enables int numbers to be entered, and also if the user enters a nonexistant product number, it will display a "no product found for this ID" message:
<br><br>

<img width="198" alt="project6_p47" src="https://github.com/hmody360/Project-6/assets/98014312/921835f8-26ab-4161-bb43-f715275cca55">
<br><br>

### Edit a product
The asmin can edit a product by clicking the edit icon next to it, then they'll be able to see its current information and edit them freely, also no empty fields allowed.
<br><br>

<img width="197" alt="project6_p48" src="https://github.com/hmody360/Project-6/assets/98014312/a69bba9d-e599-4281-ab82-9f7c0cda7e48">
<img width="199" alt="project6_p49" src="https://github.com/hmody360/Project-6/assets/98014312/d1eb2971-a76d-4a61-85fc-1eeb9494c38b">
<img width="199" alt="project6_p50" src="https://github.com/hmody360/Project-6/assets/98014312/9db73641-6289-48a1-ae4b-6f2e814be166">
<br><br>

### Add a product
The Admin can add a product by clicking on the floating add button, which will show them a bottom sheet with textfields, to fill the product info, no empty fields allowed.
<br><br>

<img width="196" alt="project6_p51" src="https://github.com/hmody360/Project-6/assets/98014312/18f773ba-bdf6-42ad-bb2c-c780e794d39a">
<img width="199" alt="project6_p52" src="https://github.com/hmody360/Project-6/assets/98014312/7ca27eb3-8838-471c-bc7d-e1c958df26fe">
<img width="196" alt="project6_p53" src="https://github.com/hmody360/Project-6/assets/98014312/26e15919-09ed-4e9b-a9c1-1ff08195a226">
<img width="200" alt="project6_p54" src="https://github.com/hmody360/Project-6/assets/98014312/f6216ed4-ab4d-4ce1-8031-e1ba7a08bef1">
<br><br>

## Admin Users Page
In this page the admin can fully view all users's information and search for usrs, by id, if the search field id empty, all users will be shown, if the id is no-existant, a "No user found with this ID" message will be shown, and only int numbers are allowed in this text field.
<br><br>

<img width="197" alt="project6_p55" src="https://github.com/hmody360/Project-6/assets/98014312/ba953413-6c67-45e8-b2cd-bbbbe0596559">
<img width="198" alt="project6_p56" src="https://github.com/hmody360/Project-6/assets/98014312/0da67c77-ed4e-4f22-817b-b0e1ee472e2c">
<br><br>

<hr>

## Packages Used
- Flutter BLoC
- HTTP
- Font Awesome Flutter
- Get It
- Email Validator
- Cached Network Image
- Image Picker
- Carousel Slider
- Badges

## P.S
I hope you enjoyed reading through this and I hope you have fun using the application, your feedback is important, and have a nice day.