{extends file="main.tpl"}

{block name = header}<p>KALKUALTOR </p> {/block}

{block name=footer}Kalkulator obliczania rat{/block}

{block name=content}

<h3>Kalkulator obliczania rat kredytu ! </h2>


<form class="pure-form pure-form-stacked" action="{$conf->action_root}datas" method="post">
	<fieldset>
		<label for="kw">Kwota kredytu</label>
		<input id="kw" type="number" min="1000" max="100000" placeholder="1-100000" name="kw" value="{$form->x}">
	<br>
		<label style="color: white;" for="rt">podaj ilość rat</label>
		<input type="range" min="3" max="36" step="3" name="rt" value="{$form->y}" oninput="this.nextElementSibling.value = this.value" >
		<output  style="color: white;">{$form->y}</output>
	<br><br>
		<label for="op">oprocentowanie</label>
		<input placeholder="1-15%" id="op" type="number" min="1.0" max="15.0" name="op" value="{$form->op}">
	</fieldset>
	<button type="submit" class="pure-button pure-button-primary">Oblicz</button>
</form>




<div class="messages">

	{* wyświeltenie listy błędów, jeśli istnieją *}
	{if $msgs->isError()}
		<h4>Wystąpiły błędy: </h4>
		<ol class="err">
		{foreach $msgs->getErrors() as $err}
		{strip}
			<li>{$err}</li>
		{/strip}
		{/foreach}
		</ol>
	{/if}
	
	{* wyświeltenie listy informacji, jeśli istnieją *}
	{if $msgs->isInfo()}
		<h4>Informacje: </h4>
		<ol class="inf">
		{foreach $msgs->getInfos() as $inf}
		{strip}
			<li>{$inf}</li>
		{/strip}
		{/foreach}
		</ol>
	{/if}
	
	{if isset($res->result)}
		<h4>Wynik</h4>
		<p class="res">
		Miesięczna rata wynosi: {$res->result}<br>
		Prowizja to: {$res->prowizja}<br>
		Kwota do spłaty: {$res->kwotaend}<br> 
		</p>
	{/if}

</div>

{/block}