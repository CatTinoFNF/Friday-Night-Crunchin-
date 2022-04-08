function onCreate()
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
       setPropertyFromClass('ClientPrefs', 'middleScroll', false);
        keepScroll = true;
end
end

function onDestroy()
    if keepScroll == true then
        setPropertyFromClass('ClientPrefs', 'middleScroll', true);
    end
end
