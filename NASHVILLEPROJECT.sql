SELECT *
FROM Portfolio_project.dbo.[Nashville Housing]

SELECT SaleDateConverted, CONVERT(date,SaleDate)
FROM Portfolio_project.dbo.[Nashville Housing]


Update [Nashville Housing]
SET SaleDate = CONVERT(date, SaleDate)

ALTER TABLE [Nashville Housing]
ADD SaleDateConverted Date; 

Update [Nashville Housing]
SET SaleDateConverted = CONVERT(date, SaleDate)



SELECT PropertyAddress
  FROM Portfolio_project.dbo.[Nashville Housing]
--WHERE PropertyAddress is null
 Order BY ParcelID


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL (a.PropertyAddress, b.PropertyAddress )
  FROM Portfolio_project.dbo.[Nashville Housing] a
  JOIN Portfolio_project.dbo.[Nashville Housing] b
    ON a.ParcelID = b.ParcelID
   AND a.[UniqueID ] <> b.[UniqueID ]
   WHERE a.PropertyAddress is null


   UPDATE a
   SET PropertyAddress = ISNULL (a.PropertyAddress, b.PropertyAddress )
  FROM Portfolio_project.dbo.[Nashville Housing] a
  JOIN Portfolio_project.dbo.[Nashville Housing] b
    ON a.ParcelID = b.ParcelID
   AND a.[UniqueID ] <> b.[UniqueID ]
 WHERE a.PropertyAddress is null


 SELECT PropertyAddress
  FROM Portfolio_project.dbo.[Nashville Housing]
--WHERE PropertyAddress is null
 --Order BY ParcelID

 SELECT
 SUBSTRING (PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
 , SUBSTRING (PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as Address
 FROM Portfolio_project.dbo.[Nashville Housing]


 ALTER TABLE [Nashville Housing]
       ADD PropertySplitAddress Nvarchar(255); 

Update [Nashville Housing]
   SET PropertySplitAddress = CONVERT(date, SaleDate)

ALTER TABLE [Nashville Housing]
      ADD PropertySplitCity Nvarchar(255); 

Update [Nashville Housing]
   SET PropertySplitCity = SUBSTRING (PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress))


   SELECT *
     FROM Portfolio_project.dbo.[Nashville Housing]


   SELECT OwnerAddress
     FROM Portfolio_project.dbo.[Nashville Housing]


	 SELECT
	 PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
	 PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
	 PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
	  FROM Portfolio_project.dbo.[Nashville Housing]



	   ALTER TABLE [Nashville Housing]
       ADD OwnerSplitAddress Nvarchar(255); 

Update [Nashville Housing]
   SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

ALTER TABLE [Nashville Housing]
      ADD OwnerSplitCity Nvarchar(255); 

Update [Nashville Housing]
   SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

   ALTER TABLE [Nashville Housing]
      ADD OwnerSplitState Nvarchar(255); 

Update [Nashville Housing]
   SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)


   
   SELECT Distinct (SoldAsVacant), Count(SoldAsVacant)
     FROM Portfolio_project.dbo.[Nashville Housing]
	 Group BY SoldAsVacant
	 Order By 2


	 SELECT SoldAsVacant,
	 CASE When SoldAsVacant = 'Y' THEN 'Yes'
	      When SoldAsVacant = 'N' THEN 'No'
		  ELSE SoldAsVacant
		  END
	  FROM Portfolio_project.dbo.[Nashville Housing]

	  UPDATE [Nashville Housing]
	  SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	      When SoldAsVacant = 'N' THEN 'No'
		  ELSE SoldAsVacant
		  END

WITH RowNumCTE AS(
SELECT *,
   ROW_NUMBER() OVER (
   PARTITION BY ParcelID,
                PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
				ORDER BY
				   UniqueID 
				   ) row_num



FROM Portfolio_project.dbo.[Nashville Housing]
)

 SELECT *
 FROM RowNumCTE
 WHERE row_num > 1 
 ORDER BY PropertyAddress




  SELECT *
  FROM Portfolio_project.dbo.[Nashville Housing]


  ALTER TABLE Portfolio_project.dbo.[Nashville Housing]
  DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress


    ALTER TABLE Portfolio_project.dbo.[Nashville Housing]
    DROP COLUMN SaleDate




	-- DATA IS NOW CLEAN AND MUCH MORE USER FRIENDLY 