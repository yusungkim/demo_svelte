<script>
  let count = 0
  const increment = () => {
    count += 1
  }
</script>

<button on:click={increment} class="p-2 border rounded-lg bg-orange-300 shadow-lg hover:scale-105 active:bg-orange-400">
  count is {count}
</button>
