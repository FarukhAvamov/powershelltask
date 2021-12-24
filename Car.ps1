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
    [string]KmLet(){
        if ($this.CurrentFuel -eq 0)
    }
}
$newCat = [car]::new()
$newCat.ToString()
s
# · Возвращающий строку, в которой перечислены все свойства объекта

# · Возвращающий информацию о количестве километров, которые еще можно проехать

# · Возвращающий информацию о количестве часов, которые еще можно проехать