Class Car {
    [string] $Brand
    [string] $Model
    [int] $DoorsAmount
    [double] $FuelConsumption
    [double] $CurrentFuel

    Car (
        [String] $Brand,
        [string] $Model,
        [int] $DoorsAmount,
        [double] $FuelConsumption,
        [double] $CurrentFuel
        )
    {
        $this.Brand = $Brand
        $this.Model = $Model
        $this.DoorsAmount = $DoorsAmount
        $this.FuelConsumption = $FuelConsumption
        $this.CurrentFuel = $CurrentFuel
    }

    [String] ToString(){
        return "brand = $($this.Brand),model = $($this.Model),doors amount = $($this.DoorsAmount),fuel consumption = $($this.FuelConsumption),current fuel = $($this.CurrentFuel)"
    }
    [string]KmLeft(){
        if ($this.CurrentFuel -le 0 -or $this.FuelConsumption -le 0) {
            return "Wrond data"
        } else {
            return [math]::Round($this.CurrentFuel / $this.FuelConsumption * 100, 2);
        }
    }

    [string]HoursLeft([int]$HoursPerKm){
        $kmToSec =[timespan]::FromSeconds([math]::Round($this.CurrentFuel / $this.FuelConsumption * 100, 2)/$HoursPerKm * 60 * 60)
        return $kmToSec.ToString("hh' hours 'mm' minutes 'ss' seconds'")

    }
}
$audiCar = [Car]::new("Audi", "A5s", 3, 10.1, 50)
$audiCar.ToString()

# $newCat = [car]::new()
# $newCat.FuelConsumption = 10
# $newCat.CurrentFuel = 60
# $newCat.KmLeft()
# $newCat.HoursLeft(100)

