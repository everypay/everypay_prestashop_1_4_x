{capture name=path}{l s='Card Payment (Everypay)' mod='everypay_prestashop_1_4_x'}{/capture}

{include file="$tpl_dir./breadcrumb.tpl"}

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

<h2>{l s='Complete your order' mod='everypay_prestashop_1_4_x'}</h2>

<div id="everypay_confirmation_wrapper" class="everypay_selection_wrapper_confirm">

    {if isset($EVERYPAY_MSG) && $EVERYPAY_MSG}
        <div class="warning">{$EVERYPAY_MSG}</div>    
    {/if}
    <form action="{$EVERYPAY_FORM_ACTION}" method="post">
        <p>                
            {l s='Here is a short summary of your order:' mod='everypay_prestashop_1_4_x'}
        </p>
        <p>
            {l s='The amount of ' mod='everypay_prestashop_1_4_x'} <span id="amount" class="price">{displayPrice price=$amount}</span> {l s='will be subtracted from your card.' mod='everypay_prestashop_1_4_x'}                
        </p>
        <p>   
            <br /><br />
            <b>{l s='Please confirm your order by clicking \'I confirm my order\'' mod='everypay_prestashop_1_4_x'}</b>
        </p>
        <p class="cart_navigation">
            <input type="submit" name="submitConfirm" value="{l s='I confirm my order' mod='everypay_prestashop_1_4_x'}" class="exclusive_large" />
            <a href="{$link->getPageLink('order.php', true)}?step=3" class="button_large">{l s='Other payment methods' mod='everypay_prestashop_1_4_x'}</a>
        </p>
    </form>

</div>
