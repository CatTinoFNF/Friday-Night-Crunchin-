function onCreatePost()
    check = getPropertyFromClass('ClientPrefs', 'hideHud')
    setPropertyFromClass('ClientPrefs', 'hideHud', true)
end

function onDestroy()
    if check then
        setPropertyFromClass('ClientPrefs', 'hideHud', true)
    elseif not check then
        setPropertyFromClass('ClientPrefs', 'hideHud', false)
    end
end