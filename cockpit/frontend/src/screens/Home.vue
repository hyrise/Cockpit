<template>
  <div id="home">
  <h1>Hello App!</h1>
  <p>
    <!-- use router-link component for navigation. -->
    <!-- specify the link by passing the `to` prop. -->
    <!-- <router-link> will be rendered as an `<a>` tag by default -->
    <router-link to="/database">Go to monitoring</router-link>
    <router-link to="/">Go to workload generation</router-link>
  </p>
  <!-- route outlet -->
  <!-- component matched by the route will render here -->
  <router-view></router-view>
</div>
</template>
