<p>{l s='Your order on' mod='everypay_prestashop_1_4_x'} <span class="bold">{$shop_name}</span> {l s='is complete.' mod='everypay_prestashop_1_4_x'}
    <br />

<div class="everypay_selection_wrapper_">
    <h3>{l s='Some details about your order' mod='everypay_prestashop_1_4_x'}:</h3>
    <ul class="ev_order_details">

        <li>
            {if isset($order->reference)&& !empty($order->reference)}
                <span>{l s='Reference' mod='everypay_prestashop_1_4_x'}:</span> {$order->reference} (id:{$order_id_formatted})
            {else}
                <span>{l s='ID number' mod='everypay_prestashop_1_4_x'}:</span> {$order_id_formatted}   
            {/if}
        </li>
        <li><span>{l s='Total amount paid' mod='everypay_prestashop_1_4_x'}:</span> {$total_paid}</li>
        <li><span>{l s='Payment way' mod='everypay_prestashop_1_4_x'}:</span> {$order->payment}</li>
        {if isset($carrier->name) && !empty($carrier->name)}
            <li><span>{l s='Delivery method' mod='everypay_prestashop_1_4_x'}:</span> {$carrier->name}</li>
        {/if}
        <li><span>{l s='Current state' mod='everypay_prestashop_1_4_x'}:</span> {$state['name']}</li>
    </ul>
</div>
<br />{l s='For any questions or for further information, please contact our' mod='everypay_prestashop_1_4_x'} 
<a href="{$link->getPageLink('contact-form', true)}">{l s='customer support' mod='everypay_prestashop_1_4_x'}</a>.
<br />
{l s='Thank you for your trust.' mod='everypay_prestashop_1_4_x'}
</p>