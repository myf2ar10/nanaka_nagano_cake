// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// public側cssファイルの読み込み
import '../stylesheets/public/address/edit.css';
import '../stylesheets/public/address/index.css';
import '../stylesheets/public/cart_items/index.css';
import '../stylesheets/public/homes/top.css';
import '../stylesheets/public/homes/about.css';
import '../stylesheets/public/items/index.css';
import '../stylesheets/public/items/show.css';
import '../stylesheets/public/members/confirm_quit.css';
import '../stylesheets/public/members/edit.css';
import '../stylesheets/public/members/show.css';
import '../stylesheets/public/orders/complete.css';
import '../stylesheets/public/orders/confirm.css';
import '../stylesheets/public/orders/new.css';
import '../stylesheets/public/orders/show.css';
import '../stylesheets/public/registrations/new.css';
import '../stylesheets/public/sessions/new.css';

// admin側cssファイルの読み込み

import '../stylesheets/admin/genres/edit.css';
import '../stylesheets/admin/genres/index.css';
import '../stylesheets/admin/homes/top.css';
import '../stylesheets/admin/items/edit.css';
import '../stylesheets/admin/items/index.css';
import '../stylesheets/admin/items/new.css';
import '../stylesheets/admin/items/show.css';
import '../stylesheets/admin/members/edit.css';
import '../stylesheets/admin/members/index.css';
import '../stylesheets/admin/members/show.css';
import '../stylesheets/admin/orders/individual.css';
import '../stylesheets/admin/orders/show.css';
import '../stylesheets/admin/sessions/new.css';
