<script>
  import ContactCard from "./lib/ContactCard.svelte";
  import Counter from "./lib/Counter.svelte";

  let name = "Kim";
  let age = 39;
  let jobTitle = "Scientist";
  let description = "Has Great Skills";
  let userImage = "https://via.placeholder.com/300/09f/fff.png";

  $: if (name == "Kim") {
    age = 39;
  }
  $: uppercaseName = name.toUpperCase();
  $: console.log(name, age);

  const increaseAge = () => age++;
  const updateName = (e) => (name = e.target.value);
</script>

<main class="max-w-7xl mx-auto px-8 sm:px-16">
  <section class="p-6 ">
    <div class="flex-col">
      <h2 class="text-4xl font-semibold pb-5">Counter demo</h2>
      <div
        class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5 h-20"
      >
        {#each [1, 2, 3, 4] as _}
          <Counter />
        {/each}
      </div>
    </div>
  </section>
  <section class="p-6">
    <h2 class="text-4xl font-semibold my-2">
      Hello {uppercaseName}, My age is {age}!
    </h2>
    <button
      on:click={increaseAge}
      class="hover:scale-105 active:bg-red-700 p-2 bg-red-600 text-white rounded-md"
      >Increase Age</button
    >
    <div class="flex justify-between py-2">
      <input
        class="border-2 rounded-md p-1"
        type="text"
        value={name}
        placeholder="name"
        on:input={updateName}
      />
      <input
        class="border-2 rounded-md p-1"
        type="text"
        placeholder="job"
        bind:value={jobTitle}
      />
      <input
        class="border-2 rounded-md p-1"
        type="text"
        placeholder="job"
        bind:value={userImage}
      />
    </div>
    <textarea bind:value={description} class="border-2 w-full max-h-max" />
  </section>
  <section class="p-6">
    <ContactCard userName={name} {jobTitle} {description} {userImage} />
  </section>
</main>
