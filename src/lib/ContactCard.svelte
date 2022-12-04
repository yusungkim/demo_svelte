<script>
  export let userName = "User Name";
  export let jobTitle = "Job Title";
  export let description = "A short description here.";
  export let userImage;
</script>

<div class="border-2 shadow-md rounded-md">
  <div class="h-28 flex gap-2 items-center p-2 ">
    {#if (userImage)}
      <img class="w-24 aspect-square bg-stone-400 rounded-md" src={userImage} alt={userName} />
    {:else}
      <div class="w-24 aspect-square bg-stone-400 rounded-md" />  
    {/if}
    <div class="flex flex-col h-full justify-around">
      <h1 class="text-xl font-bold font-serif">{userName}</h1>
      <h2 class="text-lg">{jobTitle}</h2>
    </div>
  </div>
  <hr class="border-1" />
  <div class="h-32 max-h-min p-2 flex items-center">
    <p>{description}</p>
  </div>
</div>
