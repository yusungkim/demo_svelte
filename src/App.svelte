<script>
  import ContactCard from "./lib/ContactCard.svelte";
  import Counter from "./lib/Counter.svelte";
  import { v4 as uuidv4 } from 'uuid';

  let name = "Kim";
  let age = 39;
  let jobTitle = "Scientist";
  let description = "Has Great Skills";
  let userImage = "https://via.placeholder.com/300/09f/fff.png";
  let createdContacts = [];

  $: if (name == "Kim") {
    age = 39;
  }
  $: uppercaseName = name.toUpperCase();
  $: console.log(createdContacts);

  const isEmpty = (v) => v.trim().length == 0;
  const increaseAge = () => age++;
  const updateName = (e) => name = e.target.value;
  const createContact = () => {
    if (
      isEmpty(name) ||
      isEmpty(jobTitle) ||
      isEmpty(description) ||
      isEmpty(userImage)
    ) {
      return;
    }
    const contact = {
      id: uuidv4(),
      name,
      age,
      jobTitle,
      description,
      userImage,
    };
    // "createdContacts.push(contact)" doesn't work properly, because .push does not fire change event for svelte.
    createdContacts = [...createdContacts, contact];
  };
  const deleteFirst = () => createdContacts = createdContacts.slice(1)
  const deleteLast = () => createdContacts = createdContacts.slice(0, -1)
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
      class="hover:scale-105 active:bg-orange-700 p-2 bg-orange-600 text-white rounded-md"
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
    <div class="flex gap-5">
      <button
      class="bg-green-400 p-4 rounded-md shadow-lg hover:scale-105 active:bg-green-500 active:scale-100 transition ease-out duration-100"
      on:click={createContact}
    >
      Create Contact
    </button>
    <button
      class="bg-red-400 p-4 rounded-md shadow-lg hover:scale-105 active:bg-red-500 active:scale-100 transition ease-out duration-100"
      on:click={deleteFirst}
    >
      Delete First
    </button>
    <button
      class="bg-red-400 p-4 rounded-md shadow-lg hover:scale-105 active:bg-red-500 active:scale-100 transition ease-out duration-100"
      on:click={deleteLast}
    >
      Delete Last
    </button>
    </div>
  </section>
  <section class="p-6">
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-2">
      {#each createdContacts as contact, index (contact.id)}
        <div class="flex flex-col">
          <h3>#{index + 1} ({contact.id.split('-')[0]})</h3>
          <ContactCard info={contact} />
        </div>
      {:else}
        <p>Please create a new contact.</p>
      {/each}
    </div>
  </section>
</main>
