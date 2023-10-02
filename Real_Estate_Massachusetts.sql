create table real_estate (
	status text,
	bed decimal,
	bath decimal,
	acre_lot decimal,
	city varchar(255),
	us_state varchar(50),
	zip_code varchar(10),
	house_size decimal,
	prev_sold_date date,
	price decimal
)
;

/* FINAL */

select
	status,
	bed,
	bath,
	acre_lot,
	city,
	us_state,
	zip_code,
	house_size,
	prev_sold_date,
	price,
	case
		when (acre_lot < 0.09) then '<0.1'
		when (acre_lot between 0.1 and 0.29) then '0.1-0.29'
		when (acre_lot between 0.3 and .49) then '0.3-0.49'
		when (acre_lot between 0.5 and 0.749) then '0.5-0.749'
		when (acre_lot between 0.75 and 0.99) then '0.749-0.99'
		when (acre_lot between 1.0 and 1.49) then '1.0-1.49'
		when (acre_lot between 1.50 and 1.99) then '1.50-1.99'
		when (acre_lot between 2.0 and 4.99) then '2.0-4.99'
		when (acre_lot between 5.0 and 9.99) then '5.0-9.99'
		when (acre_lot between 10.0 and 999999999) then '>10'
		else null
		END
	as lot_size_range_acres,
	case
		when (price < 49999) then '<50k'
		when (price between 50000 and 99999)  then '50-99k'
		when (price between 100000 and 199999) then '100-199k'
		when (price between 200000 and 299999) then '200-299k'
		when (price between 300000 and 499999) then '300-499k'
		when (price between 500000 and 749999) then '500-749k'
		when (price between 750000 and 999999) then '750-999k'
		when (price between 1000000 and 9999999999) then '>1m'
		else null
		END
	as price_range,
	case
		when (house_size < 999) then '<1000'
		when (house_size between 1000 and 1999) then '1000-1999'
		when (house_size between 1200 and 1499) then '1200-1499'
		when (house_size between 1500 and 1749) then '1500-1749'
		when (house_size between 1750 and 1999) then '1750-1999'
		when (house_size between 2000 and 2499) then '2000-2499'
		when (house_size between 2500 and 2999) then '2500-2999'
		when (house_size between 3000 and 3999) then '3000-3999'
		when (house_size between 4000 and 4999) then '4000-4999'
		when (house_size between 5000 and 9999999) then '>5000'
		else null
		END
	as house_size_range,
	case
		when city in ('Barnstable', 'Brewster', 'Buzzards Bay', 'Chatham', 'Dennis', 'East Brewster', 'East Dennis',
					  'East Falmouth', 'East Orleans', 'East Sandwich', 'Falmouth Heights', 'Harwich', 'Harwich Port',
					  'Hyannis', 'Marstons Mills', 'Menauhant', 'Menemsha', 'North Eastham', 'North Truro', 'Orleans',
					  'Osterville', 'Pleasant Lake', 'Pocasset', 'Provincetown', 'Quissett', 'Sandwich', 'Santuit', 'Silver Beach',
					  'South Chatham', 'South Orleans', 'South Wellfleet', 'South Yarmouth', 'Teaticket', 'Truro', 'Waquoit',
					  'West Barnstable', 'West Yarmouth', 'Wianno', 'Woods Hole', 'Yarmouth', 'Bourne', 'Bournedale', 'Cataumet',
					  'Centerville', 'Cotuit', 'Cummaquid', 'Dennis Port', 'East Harwich', 'Eastham', 'Falmouth', 'Forestdale',
					  'Hyannis Port', 'Mashpee', 'Monument Beach', 'New Seabury', 'North Chatham', 'North Falmouth', 'Popponesset',
					  'Popponesset Island', 'Sagamore Beach', 'South Dennis', 'Wellfleet', 'West Chatham', 'West Dennis',
					  'West Falmouth', 'West Harwich', 'Yarmouth Port'
					 	) then 'Barnstable'
		when city in ('Adams', 'Alford', 'Ashley Falls', 'Becker', 'Becker Center', 'Berkshire', 'Briggsille', 'Chester',
					  'Coltsville', 'Dalton', 'Densenville', 'East Lee', 'East Otis', 'East Windsor', 'Egremont', 'Glendale',
					  'Great Barrington', 'Hancock', 'Hartsville', 'Hinsdale', 'Hoosac Tunnel', 'Housatonic', 'Lanesborough',
					  'Lee', 'Lenox', 'Maple Grove', 'Mill River', 'Monterey', 'Montville', 'New Boston', 'North Adams', 'North Otis',
					  'Otis', 'Peru', 'Pittsfield', 'Richmond', 'Sandisfield', 'Sheffield', 'South Sandisfield', 'South Williamstown',
					  'Stockbridge', 'Timberline', 'Tyngham', 'Washington', 'Williamstown', 'Windsor', 'Becket', 'Cheshire',
					  'Clarksburg', 'Florida', 'Mount Washington', 'New Ashford', 'New Marlborough', 'Savoy', 'Tyringham',
					  'West Stockbridge', 'New Marlboro'
						) then 'Berkshire'
		when city in ('Acushnet', 'Attleboro', 'Clifford', 'Dartmouth', 'East Mansfield', 'East Taunton', 'Easton', 'Fairhaven',
					  'Fall River', 'Long Plain', 'Mansfield', 'New Bedford', 'North Dartmouth', 'North Easton', 'North Rehoboth',
					  'North Westport', 'Norton', 'Oakland', 'Padamaram', 'Rehoboth', 'Somerset', 'South Attleboro', 'South Easton',
					  'Swansea', 'Taunton', 'Tiverton Four', 'Westport', 'Berkley', 'Dighton', 'Freetown', 'North Attleboro',
					  'Raynham', 'Seekonk'
						) then 'Bristol'
		when city in ('Chilmark', 'Chop', 'East Chop', 'East Ville', 'Edgartown', 'Katama', 'Martha''s Vineyard', 'North Tisbury',
					  'Oak Bluffs', 'Tisbury', 'Vineyard Haven', 'West Chop', 'West Tisbury', 'Aquinnah'
						) then 'Dukes'
		when city in ('Amesbury', 'Andover', 'Beach Bluff', 'Beverly', 'Boxford', 'Bradford', 'Byfield', 'Clifton', 'Cliftondale',
					  'Danvers', 'East Saugus', 'Essex', 'Gloucester', 'Greenwood', 'Groveland', 'Haverhill', 'Ipswich', 'Lawrence',
					  'Little Neck', 'Lynn', 'Lynnfield', 'Manchester', 'Marblehead', 'Merrimac', 'Methuen', 'Middleton', 'Nahant',
					  'Newbury', 'Newburyport', 'North Andover', 'North Saugus', 'Oakland Vale', 'Peabody', 'Pigeon Cove', 'Plum Island',
					  'Rockport', 'Rowley', 'Salem', 'Salisbury', 'Saugus', 'Swampscott', 'Topsfield', 'Wenham', 'West Andover',
					  'Georgetown', 'Hamilton', 'West Newbury'
						) then 'Essex'
		when city in ('Adamsville', 'Ashfield', 'Bernardston', 'Buckland', 'Buckland Four Corners', 'Charlemont', 'Colrain',
					  'Conway', 'Cushman', 'Deerfield', 'East Deerfield', 'East Leverett', 'East Northfield', 'Gill', 'Greenfield',
					  'Hatfield', 'Hawley', 'Heath', 'Lake Pleasant', 'Leverett', 'Lock Village', 'Millers Falls', 'Monroe',
					  'Montague', 'Moores Corner', 'New Salem', 'North Bernardston', 'North Orange', 'Northfield Farms',
					  'Orange', 'Rowe', 'Shelburne Falls', 'Shutebury', 'Spruce Corner', 'Sunderland', 'Tully', 'Turner Falls',
					  'Warwick', 'Wendell', 'West Cummington', 'West Orange', 'West Whateley', 'Whately', 'Erving', 'Leyden',
					  'Northfield', 'Shelburne', 'Shutesbury'
					 	) then 'Franklin'
		when city in ('Agawam', 'Brimfield', 'Chester Center', 'Chicopee', 'East Brimfield', 'East Longmeadow', 'Feeding Hills',
					  'Fentonville', 'Granville', 'Hadley Falls', 'Holyoke', 'Longmeadow', 'Monson', 'North Blandford',
					  'North Monson', 'Palmer Center', 'Russell', 'Southwick', 'Springfield', 'Three Rivers', 'Wales', 'West Farms',
					  'West Field', 'West Granville', 'West Springfield', 'Wilbraham', 'Woronoco', 'Blandford', 'Hampden', 'Holland',
					  'Ludlow', 'Montgomery', 'Palmer', 'Tolland', 'Westfield'
						) then 'Hampden'
		when city in ('Amherst', 'Cummington', 'Cushman Village', 'Easthampton', 'Granby', 'Hadley', 'Haydenville',
					  'Leeds', 'Middlefield', 'North Amherst', 'North Hatfield', 'Northampton', 'Pelham', 'Plainfield',
					  'South Hadley', 'Southampton', 'Swift River', 'Ware', 'West Cummington', 'West Hatfield', 'Williamsburg', 
					  'Worthington Corners', 'Belchertown', 'Chesterfield', 'Goshen', 'Huntington', 'Westhampton', 'Worthington'
						) then 'Hampshire'
		when city in ('Acton', 'Ayer', 'Ballardvale', 'Bedford', 'Bellingham', 'Chelmsford', 'Clinton', 'Collinsville', 'Concord',
					  'Dunstable', 'Everett', 'Forge Village', 'Framingham', 'Groton', 'Holiston', 'Hopkinton', 'Hudson',
					  'Littleton Common', 'Lowell', 'Malden', 'Marlborough', 'Maynard', 'Medford', 'Medway', 'Melrose',
					  'Natick', 'North Billerica', 'North Reading', 'Pepperell', 'Reading', 'Saxonville', 'Sherborn', 'Somerville',
					  'Stoneham', 'Stow', 'Sudbury', 'Tewksbury', 'Townsent', 'Tyngsborough', 'Wakefield', 'Watertown', 'Weston',
					  'Wilmington', 'Winchester', 'Woburn', 'Arlington', 'Ashland', 'Belmont', 'Billerica', 'Boxborough',
					  'Burlington', 'Carlisle', 'Devens', 'Dracut', 'Framington', 'Holliston', 'Lexington', 'Lincoln', 'Littleton',
					  'Townsend', 'Waltham', 'Wayland', 'Westford'
					 	) then 'Middlesex'
		when city in ('Madaket', 'Monomay', 'Nantucket', 'Polpis', 'Quidnet', 'Sankaty Head', 'Siasconset', 'Surfise', 'Wauwinet'
						) then 'Nantucket'
		when city in ('Bellingham', 'Braintree', 'Brookline', 'Canton', 'Cohasset', 'Dedham', 'Dover', 'Foxboro', 'Holbrook',
					  'Medway', 'Millis', 'Needham', 'Quincy', 'Randolph', 'Sharon', 'Sharon Heights', 'Sheldenville',
					  'Stoughton', 'Walpole', 'Wellesley', 'West Medway', 'Weymouth', 'Wrentham', 'Avon', 'Franklin', 'Medfield',
					  'Milton', 'Norfolk', 'Norwood', 'Plainville', 'Westwood'
						) then 'Norfolk'
		when city in ('Abington', 'Assinipp', 'Beechwood', 'Bridgewater', 'Brockton', 'Carver', 'Elmwood', 'Faye', 'Green Harbor',
					  'Greenbush', 'Hanover', 'Hanson', 'Hingham', 'Humarock', 'Kingston', 'Marshfield', 'Middleboro', 'Millbrook',
					  'Myricks', 'North Marhsfield', 'North Plymouth', 'North Situate', 'Norwell', 'Ocean Bluff', 'Pembroke',
					  'Plymouth', 'Plympton', 'Rochester', 'Rockwell', 'Scituate', 'Scotland', 'South Carver', 'West Bridgewater',
					  'Duxbury', 'East Bridgewater', 'East Wareham', 'Halifax', 'Hull', 'Lakeville', 'Marion', 'Mattapoisett',
					  'Onset', 'Rockland', 'Wareham', 'West Wareham', 'Whitman'
						) then 'Plymouth'
		when city in ('Allston', 'Back Bay', 'Boston', 'Cambridge', 'Chelsea', 'Newton', 'Revere', 'Winthrop', 'Brighton',
					  'Charlestown', 'Dorchester', 'East Boston', 'Fenway', 'Hyde Park', 'Jamaica Plain', 'Midtown', 'Roslindale',
					  'Roxbury', 'Seaport', 'South Boston', 'South End', 'Waterfront'
						) then 'Suffolk'
		when city in ('Ashburnham', 'Ashby', 'Athol', 'Auburn', 'Baldwinville', 'Barre', 'Barre Plains', 'Berlin', 'Blackstone',
					  'Boylston', 'Brookfield', 'Charlton Depot', 'Chery Valley', 'Clifton', 'Dudley', 'East Brookfield',
					  'East Princeton', 'Fitchburg', 'Furnace', 'Gardner', 'Grafton', 'Hillsville', 'Holden', 'Hopedale',
					  'Hubbardston', 'Jefferson', 'Lancaster', 'Larnedville', 'Leicester', 'Leominster', 'Lunenburg', 'Mendon',
					  'Milford', 'Millbury', 'Millville', 'New Braintree', 'North Brookfield', 'North Grafton', 'Northborough',
					  'Northbridge', 'Oakham', 'Oxford', 'Paxton', 'Petersham', 'Powers Mills', 'Princeton', 'Rochdale',
					  'Royalston', 'Rutland', 'Shrewsbury', 'Shirley', 'South Barre', 'South Royalston', 'Southborough',
					  'Southbridge', 'Spencer', 'Still River', 'Sturbridge', 'Templeton', 'Upton', 'Uxbridge', 'Ware',
					  'Webster', 'West Brookfield', 'West Dudley', 'Westminster', 'Whitinsville', 'Williamsville', 'Winchendon',
					  'Winchendon Springs', 'Worcester', 'Bolton', 'Charlton', 'Douglas', 'Hardwick', 'Harvard', 'Phillipston',
					  'Sterling', 'Sutton', 'Warren', 'West Boylston', 'Westborough'
						) then 'Worcester'
		else null
		end
	as county
from real_estate
where us_state = 'Massachusetts'
;

/* AVG PRICE Group-By ZIP_CODE  */

select
	left('0' || zip_code, -2) as zip_code,
	round(avg(price), 2) as mean_house_price
	from real_estate
	where us_state = 'Massachusetts' and status = 'for_sale'
	group by zip_code
;
	
/* AVG HOUSE_SIZE Group_By TOWN */

select
	city,
	round(avg(price), 2) as mean_house_price
	from real_estate
	where us_state = 'Massachusetts' AND status = 'for_sale'
	group by city
;