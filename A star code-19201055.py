def a_star_search(start, goal):
    # Initialize open and closed fringes, and g (distance from start) and parents dicts
    open_fringe = {start}
    closed_fringe = set()
    g = {start: 0}
    parents = {start: start}

    while open_fringe:
        # Find node n in open fringe with the lowest f(n) value
        n = min(open_fringe, key=lambda node: g[node] + heuristic(node, goal))

        # If goal node is found or no path exists, reconstruct path and return it
        if n == goal or n not in Graph_nodes:
            path = [n]
            while n != start:
                n = parents[n]
                path.append(n)
            path.reverse()
            return path

        # Expand node n and add its neighbors to the open fringe
        for neighbor, weight in Graph_nodes[n]:
            tentative_g = g[n] + weight
            if neighbor not in open_fringe and neighbor not in closed_fringe:
                open_fringe.add(neighbor)
                g[neighbor] = tentative_g
                parents[neighbor] = n
            elif tentative_g < g[neighbor]:
                g[neighbor] = tentative_g
                parents[neighbor] = n
                if neighbor in closed_fringe:
                    closed_fringe.remove(neighbor)
                    open_fringe.add(neighbor)

        # Move node n from the open to closed fringe
        open_fringe.remove(n)
        closed_fringe.add(n)

    # If open fringe is empty but goal node is not reached, return None
    return None

def heuristic(n, goal):
    # Heuristic function that returns the estimated distance from node n to the goal node
    H_dist = {
        'Home': 5,
        'Madani Nagor': 7,
        'Staf Quater': 3,
        'Sing Board': 5,
        'Soni Akra': 6,
        'Gulistan': 4,
        'Sha Bag': 6,
        'Bangla Motor': 5,
        'Karon Bazar': 3,
        'Farm Gate': 5,
        'Tajtori Bazar': 4,
        'Amulia Town': 2,
        'Mosto Majhi': 3,
        'Tri Moni': 2,
        'Ram Pura': 6,
        'Moha Khali': 2,
        'UAP': 0
    }
    return H_dist[n] 

# Test the function by finding the shortest path and its cost from H to UAP
Graph_nodes = {
    'Home': [('Madani Nagor',1.8), ('Sing Board', 2.7),('Staf Quater',0.85)],
    'Madani Nagor': [('Sing Board', 2.4)],
    'Staf Quater': [('Sing Board', 3.4), ('Amulia Town', 1.5)],
    'Sing Board': [('Soni Akra', 3.2)],
    'Soni Akra': [('Gulistan', 4.8)],
    'Gulistan': [('Sha Bag',3.0)],
    'Sha Bag': [('Bangla Motor', 0.75)],
    'Bangla Motor': [('Karon Bazar', 0.45)],
    'Karon Bazar': [('Tajtori Bazar',0.65)],
    'Tajtori Bazar': [('UAP', 3.1)],
    'Farm Gate': [('UAP', 2.5)],
    'Amulia Town': [('Mosto Majhi',0.65)],
    'Mosto Majhi': [('Tri Moni',3.2)],
    'Tri Moni': [('Ram Pura',4.0)],
    'Ram Pura': [('Moha Khali',3.2)],
    'Moha Khali': [('Farm Gate',4.2)],
    'UAP': None
}
path = a_star_search('Home', 'UAP')
print(path)