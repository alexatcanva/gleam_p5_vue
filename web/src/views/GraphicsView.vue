<script setup>
import { ref, onMounted } from "vue";
import { gleam_draw } from '../../../build/dev/javascript/draw/draw.mjs';
import p5 from "p5"

const canvas = ref()

onMounted(() => {
  gleam_draw(p5)
});

</script>

<template>
  <main>
    <div ref="canvas"></div>
  </main>
</template>
