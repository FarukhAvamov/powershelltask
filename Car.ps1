Class Car {
    [string] $Brand
    [string] $Model
    [int] $DoorsAmount
    [double] $FuelConsumption
    [double] $CurrentFuel

    [String] ToString()
    {
        return $this.Brand + ":"
        + $this.Model + ":"
        + $this.DoorsAmount + ":"
        + $this.FuelConsumption + ":"
        + $this.CurrentFuel
    }
    [string]KmLeft(){
        if ($this.CurrentFuel -le 0 -or $this.FuelConsumption -le 0) {
            return "Wrond data"
        } else {
            return [math]::Round($this.CurrentFuel / $this.FuelConsumption * 100, 2);
        }
    }

    [string]HoursLeft([int]$HoursPerKm){
        $result = 0
        $kmToSec =[timespan]::FromSeconds([math]::Round($this.CurrentFuel / $this.FuelConsumption * 100, 2)/$HoursPerKm * 60 * 60)
        return $kmToSec.ToString("hh' hours 'mm' minutes 'ss' seconds'")

    }
}
$newCat = [car]::new()
$newCat.FuelConsumption = 10
$newCat.CurrentFuel = 60
$newCat.KmLeft()
$newCat.HoursLeft(100)
